Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710079;
	b=SAR0dovkDLKsThqMII7LFLYs7x5cjXgMs5BZ2PWWdTtAXoOepRuKXGOUyf9YYqyF/Ekq
	 Eq4QSj/6Skgd6E/1cxjUztEGOD8OXpKUjW1IbPMIt0DFzQ6i4Xnp6j/QPCmY+ZOuPn/YY
	 M6MBSXrgWsqchqzt/GcaZxKZNiPI+/PY+21IzCaR81LaqoC0SaixivA93L2eBrXyioTdh
	 2oi5ZkQLU4ZSTvXtudnnrKbhkSdL3HnrOvt48WHi12/RrZciKjY034sk1S/qKFfLEzzfK
	 /bP2aGTW63itv1fu7msfSk1cKYZ5NDXHAAHE2X13YH3oNXrUD7YGED7yerlEABkXPYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710079;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Scanned-By;
	bh=A1jyeLWuWjnhHowDtKUsEW2eUs6IPRHJnLaQGdTj/pI=;
	b=HDI7USUGBgFroBRNuhAN3VqAM0TL7KNyeHe6jaGgH5Nh+Pa+VGyDHsbL7wGMvITwkNmm
	 gEEf28Oz4BOGIHSKrd0rU17uqVXu1EfEafI5MPjekpEodkqLjNme2mrICoOb95aBIfghM
	 8i9aHCKufP0qPejB7/7wzjTPrRsUtH8S89UGALXE88UM2SOxr0lhxEm7QqoYwiodoahs4
	 4Qf0hqAF2lsEaqvYagZ2iwf6+K+q4XU+OKjXQ23OkFC3jrX8+cPsuAHNqnH8F4OKxV922
	 XeCYLmQgy9csQsrt77rR7NUjwU2RRgEHWwOpJbuorYGM32kaKgSbdaW3ZfRywm2iPUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LfkiQ5WD;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52316606A336
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52316606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LfkiQ5WD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795710078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A1jyeLWuWjnhHowDtKUsEW2eUs6IPRHJnLaQGdTj/pI=;
	b=LfkiQ5WDG9tyI+neylueFNatFL8dPG7ELJ6eu5d34aHXRdAobyMuF3G/2N2wYiRjiqgpXJ
	cC0rGmG48HGeh1ynRmVirUSGuRsBIeXmRmgF7S+u3qIU0W7+Ps2UE4rpRcPVBlM+uUWTL2
	VZNhfjAhnDp+skosOJFE1uFLLe3zxkY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-50-HD0IksBpPQmyFKmIA45-hQ-1; Thu,
 26 Nov 2026 16:21:12 +0000
X-MC-Unique: HD0IksBpPQmyFKmIA45-hQ-1
X-Mimecast-MFC-AGG-ID: HD0IksBpPQmyFKmIA45-hQ_1795710071
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2CFF1955D88;
	Thu, 26 Nov 2026 16:21:10 +0000 (UTC)
Received: from pabeni-thinkpadp1gen8.rmtit.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 38D5C180197D;
	Thu, 26 Nov 2026 16:21:08 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: torvalds@linux-foundation.org
Cc: kuba@kernel.org,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Networking for v7.4-rc5
Date: Thu, 26 Nov 2026 17:20:57 +0100
Message-ID: <20261126162057.141802-1-pabeni@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi Linus!

The following changes since commit 1e575bda30acc0bf01f799cee798d4a1c100d538:

  Merge tag 'net-7.4-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-11-19 08:11:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git tags/net-7.4-rc5

for you to fetch changes up to e1055cbfd6eb578417f3ce983cf44462e8465267:

  Merge tag 'linux-can-fixes-for-7.4-20261124' of git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can (2026-11-26 15:47:14 +0100)

----------------------------------------------------------------
Including fixes from WiFi, Bluetooth and CAN.

Current release - regressions:

  - eth: mlx5e: TC, fix a NULL pointer write in the peer flow error path

Current release - new code bugs:

  - xfrm: interface: drop non-IP packets before pskb_inet_may_pull()

  - eth: b53: use the correct override register 2 Gbps bit

Previous releases - regressions:

  - core:
    - do not run out of frags in alloc_skb_with_frags()
    - gso: cow head on tcp fraglist fallback to skb_segment

  - ipv6:
    - honor suppress_prefixlength in fib6_lookup()
    - mcast: do not pass uninitialized bytes to dev_mc_add()

  - tcp:
    - don't clear saddr before ->put_port().
    - initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()

  - mptcp: fix dummy mapping of overlapping segments

  - bluetooth:
    - fix use-after-free in mgmt_powering_down()
    - fix NULL pointer dereference on failed init

  - wifi:
    - iwlwifi: fix FW crashes on old devices and with 320 MHz channels
    - ath10k: revert "stop unanswered temperature reads"
    - rtw89: fix connection drop on RTL8851BE

  - eth:
    - gve: fix checksum state of HW-GRO packets
    - mana: set a non-zero minimum interrupt moderation, fix TX timeouts
    - brcm: fix link-local detection with a prepended tag

Previous releases - always broken:

  - core:
    - initialize sk_peer_lock in cloned sockets
    - release netpoll dev_lock when NETDEV_PRE_UP vetoes an open
    - gso: fall back to skb_segment when fraglist cannot satisfy checksum

  - tcp: fix negative sk_forward_alloc after MSG_ZEROCOPY append

  - udp: only quit inuse scan early on identical SO_REUSEPORT sockets

  - ipv4: fix conntrack defrag forwarding after ip_frag_reinit()

  - vsock/bpf: release sock lock while waiting for data in recvmsg,
    fix deadlock

  - mptcp: a bunch of fixes for send stalls after fallback and TFO

  - can: avoid RTNL stalls in CAN_RAW, CAN_ISOTP and CAN_BCM

  - eth:
    - tun: bound the NAPI receive queue
    - tg3: fix heap overflow in unbuffered NVRAM write path
    - mlx5: DR, fix out-of-bounds write when sync to HW fails
    - ionic: fix TX stalls on TSO skbs larger than the TX ring
    - bcm4908: a bunch of TX/RX ring fixes

Misc:
  - add Willem de Bruijn to networking maintainers

Signed-off-by: Paolo Abeni <pabeni@redhat.com>

----------------------------------------------------------------
Alexander Duyck (3):
      fbnic: Wait for in-flight PTP timestamps before treating Tx as idle
      fbnic: Cover all of the HW stats with the stats lock
      fbnic: Initialize and reset the HW stats before they can be read

Ankit Garg (1):
      gve: fix checksum state and gso_segs of HW-GRO packets

Antonio Quartulli (2):
      tun: complete the zerocopy buffer of packets consumed by XDP
      tun: bound the NAPI receive queue

Aristo Chen (1):
      net: dsa: felix: fix NULL pointer dereference in felix_port_enable()

Artemii Mashanov (1):
      cxgb4: allocate the full ethtool filter location array

Blake Alexander (1):
      net: dsa: mv88e6xxx: do not override PHYIDs on external MDIO

Cen Zhang (2):
      Bluetooth: hci_sync: Fix remaining advertising instance UAFs
      Bluetooth: hci_sync: Use controller handles for periodic advertising

Chad Aldreda (1):
      ptp: vmclock: keep the device state until the last file is closed

Christian Brauner (2):
      net: don't leak pidfds through a short SO_PEERPIDFD optlen
      selftests/net: check that a short SO_PEERPIDFD optlen fails

Daniel Wade (1):
      net: af_key: fix use-after-free in dump_sp() on policy migrate

Dimitri Daskalakis (5):
      eth: fbnic: wait on the correct queues in fbnic_queue_stop()
      eth: fbnic: skip disabled Tx rings when setting the queue NAPI
      eth: fbnic: skip freed Tx rings in fbnic_get_ts_stats()
      netdevsim: report fake timestamping stats
      selftests: drv-net: stats: query timestamping stats while down

Dominik Maier (2):
      mptcp: gate diag sequence counters on CAP_NET_ADMIN
      udp: only quit inuse scan early on identical SO_REUSEPORT sockets

Elad Nachman (1):
      MAINTAINERS: update prestera switchdev e-mail address

Emmanuel Grumbach (3):
      wifi: iwlwifi: honor the per-channel 320 MHz regulatory flag
      wifi: iwlwifi: mvm: don't send LARI_CONFIG_CHANGE to old FW
      wifi: iwlwifi: mvm: fix VHT NSS reporting on pre-MQ devices

Eric Dumazet (3):
      net: clear skb->mac_len in skb_unset_mac_header()
      tun: flush uc and mc addresses in TUNSETLINK
      ipv6: mcast: do not pass uninitialized bytes to dev_mc_add()

Felipe Pereira Stival (2):
      tls: don't hide a queued KeyUpdate from poll()
      selftests: tls: add a poll test for a queued KeyUpdate

Felix K. (2):
      wifi: ath9k: fix beacon slot selection once TSF exceeds 2^39 us
      wifi: ath9k_htc: fix beacon slot selection once TSF exceeds 2^42 us

Florian Fainelli (7):
      net: dsa: b53: initialize the jumbo frame size register offset
      net: dsa: b53: fix the SRAB grant timeout check
      net: dsa: b53: clear stale state when creating an ARL entry
      net: dsa: b53: use the correct override register 2 Gbps bit
      net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365
      net: dsa: b53: fix mirror destination and source state tracking
      net: dsa: tag_brcm: fix link-local detection with a prepended tag

Gal Pressman (1):
      net/mlx5e: Release FIB event work flows before dropping RTNL

Geliang Tang (1):
      mptcp: fix dummy mapping of overlapping segments

Haishuang Yan (2):
      net: do not run out of frags in alloc_skb_with_frags()
      net: add a KUnit test for the alloc_skb_with_frags() tail split

Haiyang Zhang (1):
      net: mana: Set 1 usec / 1 comp as default and minimum interrupt moderation

Hao Tan (1):
      wifi: rtw89: coex: Disable pre-AGC for out-of-band links

Henry Martin (1):
      net: initialize sk_peer_lock in cloned sockets

Hungyu Lin (1):
      net/tcp-ao: fix reset key lookup for IPv4 segments on IPv6 listeners

Hyunjung Ko (1):
      l2tp: reject short IPv6 address attributes

Igor Opaniuk (1):
      net: qrtr: ns: keep notifying local servers after a failed send

Imre Kaloz (1):
      net: marvell: prestera: disable port before changing its MAC mode

Jakub Kicinski (16):
      Merge tag 'wireless-2026-11-19' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless
      Merge branch 'fbnic-follow-up-fixes-for-the-tx-idle-check-hw-stats-and-fw-mailbox-allocations'
      Merge branch 'net-bcm4908_enet-tx-ring-and-dma-fixes'
      MAINTAINERS: add Willem de Bruijn to networking maintainers
      Merge branch 'mptcp-misc-fixes-for-v7-4-rc4'
      Merge branch 'tcp-initialize-missing-request_sock-fields-in-syncookie-path'
      Merge branch 'net-mlx5-fix-hws-and-dr-steering-memory-safety-bugs'
      Merge branch 'eth-fbnic-miscellaneous-driver-fixes'
      Merge branch 'net-fix-a-pidfd-leak-with-a-short-so_peerpidfd-optlen'
      Merge branch 'net-do-not-run-out-of-frags-in-alloc_skb_with_frags'
      Merge branch 'intel-wired-lan-driver-updates-2026-11-13-ice'
      Merge tag 'for-net-2026-11-23' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth
      Merge branch 'vsock-bpf-fix-recvmsg-deadlock-and-zero-length-oob-errqueue-reads'
      Merge branch 'ionic-fix-tx-stalls-on-tso-skbs-larger-than-the-tx-ring'
      eth: bnxt_en: restore Rx coalescing after re-allocating the completion ring
      eth: bnxt_en: restore Tx coalescing after re-allocating the completion ring

Jason Xing (1):
      xsk: set network header on skb at generic transmit

Jeff Johnson (1):
      Revert "wifi: ath10k: Stop unanswered temperature reads"

Jerome Mohm (2):
      vsock/bpf: fix zero-length, MSG_OOB and MSG_ERRQUEUE reads
      vsock/bpf: release sock lock while waiting for data in recvmsg

Jiayuan Chen (5):
      ipv6, calipso: fix data-race in calipso_cache_add() bucketsize check
      tcp: fix shift-out-of-bounds in SYN-ACK retransmit timers
      tcp: fix shift-out-of-bounds in inet_csk_rto_backoff()
      ipv4: fix conntrack defrag forwarding after ip_frag_reinit()
      tcp: fix negative sk_forward_alloc after MSG_ZEROCOPY append

Jingxuan Xie (1):
      af_packet: avoid waiting for TPACKET_V3 copies at retirement

Johannes Berg (4):
      wifi: ath9k: uninline ar9003_paprd_create_curve() helpers
      Merge tag 'iwlwifi-fixes-2026-11-16' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next
      Merge tag 'ath-current-20261116' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath
      Merge tag 'rtw-2026-11-19' of https://github.com/pkshih/rtw

Jun Yang (1):
      sctp: preserve stream scheduler across outq teardown

Kiran K (2):
      Bluetooth: btintel_pcie: Set only MAC_INIT in btintel_pcie_mac_init()
      Bluetooth: btintel_pcie: Fold MAC_INIT into btintel_pcie_get_mac_access()

Kordian Chmielewski (7):
      net: bcm4908_enet: fix the TX ring wrap
      net: bcm4908_enet: drop a TX frame whose DMA mapping failed
      net: bcm4908_enet: release the TX ring on stop
      net: bcm4908_enet: unmap the buffer of a dropped RX frame
      net: bcm4908_enet: unmap RX buffers on stop with their mapped size
      net: bcm4908_enet: publish the buffer address before OWN
      net: bcm4908_enet: order the TX ring index accesses

Kuniyuki Iwashima (1):
      tcp: Don't clear saddr before ->put_port().

Leonard Lausen (2):
      ipv6: Honor suppress_prefixlength in fib6_lookup()
      selftests: netfilter: cover IPv6 FIB prefix suppression

Luiz Augusto von Dentz (17):
      Bluetooth: mgmt: Fix read_index_list() buffer overflow
      Bluetooth: hci_core: Take req_sync lock in hci_power_on()
      Bluetooth: hci_sync: Lock the lookup in hci_disable_ext_adv_instance_sync()
      Bluetooth: hci_sync: Hold hdev->lock in hci_schedule_adv_instance_sync()
      Bluetooth: SMP: Serialize link key updates from smp_notify_keys()
      Bluetooth: SMP: Check smp_data before using SMP_DEV()
      Bluetooth: SMP: Don't create the BR/EDR channel while unregistered
      Bluetooth: hci_event: Validate sent command length in LE Set Ext Adv Enable
      Bluetooth: mgmt: Reject zero multi advertising rotation duration
      Bluetooth: L2CAP: Don't use uninitialized EFS in l2cap_parse_conf_rsp()
      Bluetooth: mgmt: Fix mesh transmission locking and lifetime
      Bluetooth: MGMT: Fix use-after-free in mgmt_powering_down()
      Bluetooth: MSFT: Protect the event prefix with hdev->lock
      Bluetooth: hci_debugfs: Fix racy toggling of debugfs controlled flags
      Bluetooth: hci_core: Hold hdev->lock when removing advertisement monitors
      Bluetooth: MSFT: Free the response of the monitor commands
      Bluetooth: hci_core: Don't fail removing a monitor unknown to the controller

Marc Kleine-Budde (2):
      Merge patch series "can: avoid RTNL stalls and fix CAN_ISOTP and netlink issues"
      can: gs_usb: gs_can_start_xmit(): don't leak uninitialized memory over USB

Matthieu Baerts (NGI0) (5):
      mptcp: do not use a raised snd_wnd for the send window
      mptcp: use sk instead of casting msk in check_fully_established()
      mptcp: push queued data on passive TFO subflows becoming established
      mptcp: push queued data on subflows falling back at the handshake
      mptcp: don't send a FIN before the pending data on fallback

Michal Swiatkowski (1):
      ice: use global queue index in TC to-queue offload

Miri Korenblit (2):
      wifi: iwlwifi: trans: don't memset trans::conf when it is still needed
      wifi: iwlwifi: mvm: correctly check the API version

Nguyen Ngoc Thang (1):
      Bluetooth: L2CAP: Use a reserved ident for L2CAP_LE_CREDITS

Nicolai Buchwitz (5):
      net: bcmgenet: keep DIM from getting stuck after close or suspend
      net: bcmgenet: accumulate the DIM packet and byte counters
      net: bcmgenet: reset the Rx discard count with the ring
      net: systemport: restart DIM from the default profile on start
      net: systemport: accumulate the DIM packet and byte counters

Nikhil P. Rao (2):
      ionic: reject Tx ring sizes below the minimum
      ionic: limit TSO segments to the minimum Tx ring size

Oliver Hartkopp (7):
      can: bcm: copy the CAN frames outside of lock_sock()
      can: bcm: do not remove the procfs entry in bcm_notify()
      can: raw: use a private mutex instead of lock_sock()
      can: isotp: use a private mutex instead of lock_sock()
      can: bcm: use a private mutex instead of lock_sock()
      can: isotp: always start the rx timeout in ISOTP_WAIT_DATA state
      can: isotp: reject socket options while a transfer is active

Paolo Abeni (5):
      Merge branch 'net-gso-fraglist-segmentation-fixes'
      Merge branch 'ipv6-honor-suppress_prefixlength-in-fib6_lookup'
      Merge branch 'tls-don-t-hide-a-queued-keyupdate-from-poll'
      Merge branch 'tg3-bug-fixes'
      Merge tag 'linux-can-fixes-for-7.4-20261124' of git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can

Pavan Chebbi (2):
      tg3: Don't fail probe if 31-bit coherent DMA mask is unsupported
      tg3: Skip management FW version when APE firmware is not ready

Petr Oros (1):
      ice: allow reading the last byte of the NVM and Shadow RAM regions

Quanye Yang (1):
      mptcp: push pending data after a sendmsg copy fault

Rishikesh Jethwani (1):
      kcm: reject TLS on attached TCP sockets

Sergio Lopez (1):
      vsock/vmci: reject datagram binds in local network namespaces

SeungJong Ha (1):
      net: release netpoll dev_lock when NETDEV_PRE_UP vetoes an open

Shravya KN (1):
      tg3: Fix heap overflow in unbuffered NVRAM write path

Shuai Liu (1):
      xfrm: interface: drop non-IP packets before pskb_inet_may_pull()

Shunsuke Nagashima (1):
      wifi: ath10k: fix status of bundled mgmt tx completions

Suyuan Wang (1):
      tipc: restore write readiness when a socket's group goes away

Tariq Toukan (1):
      net/mlx5e: SHAMPO: Do not merge packets with different kTLS RX state

Thaison Phan (2):
      tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
      tcp: accecn: initialize AccECN fields in syncookie path

Thomas de Gruijter (2):
      Bluetooth: MSFT: Record the filter state on Command Disallowed
      Bluetooth: MSFT: Only enable the advertisement filter with monitors

Tianyi Gao (1):
      xsk: reject TX checksum requests that overflow skb->csum_start

Toke Høiland-Jørgensen (1):
      wifi: ath9k: make sure we stop the wmi tasklet on init fail

Tzung-Bi Shih (2):
      Bluetooth: btrtl: Propagate errors if btrtl_vendor_read_reg16() fails
      Bluetooth: btrtl: Return -ENOMEM if bt_skb_alloc() fails

Uri Dar (1):
      net/mlx5: E-Switch, skip vport change work for disabled vports

Uwe Kleine-König (The Capable Hub) (1):
      can: flexcan: Fix probing for m68k/coldfire

Wang Haoran (1):
      net: bcmasp: avoid refcount drain on probe

Willem de Bruijn (4):
      net: gso: cow head on tcp fraglist fallback to skb_segment
      net: gso: fall back to skb_segment when fraglist cannot satisfy checksum
      Merge branch 'net-dsa-b53-preliminary-fixes'
      Merge branch 'net-bcmgenet-systemport-dim-and-rx-discard-fixes'

Xu Rao (1):
      vhost/net: Fix receive queue test in busy poll

Yevgeny Kliteynik (2):
      net/mlx5: HWS, Handle NULL in vport destination action creation
      net/mlx5: DR, Fix out-of-bounds write when sync to HW fails

Zhao Li (2):
      Bluetooth: MGMT: Retain the selected legacy advertising schedule ID
      net/mlx5e: TC, fix a NULL pointer write in the peer flow error path

Zhu Ling (3):
      can: netlink: fix static FD-NON-ISO mode validation
      can: netlink: fix IFLA_CAN_BITRATE_MAX attribute sizing
      can: netlink: fix CAN XL PWM attribute sizing

 Documentation/networking/ip-sysctl.rst             |   2 +-
 Documentation/networking/kcm.rst                   |   3 +
 Documentation/networking/tls.rst                   |   7 +-
 MAINTAINERS                                        |   3 +-
 drivers/bluetooth/btintel_pcie.c                   |  31 +-
 drivers/bluetooth/btrtl.c                          |   9 +-
 drivers/net/can/dev/netlink.c                      |  22 +-
 drivers/net/can/flexcan/flexcan-core.c             |  12 +-
 drivers/net/can/usb/gs_usb.c                       |   2 +-
 drivers/net/dsa/b53/b53_common.c                   | 209 +++++++++---
 drivers/net/dsa/b53/b53_priv.h                     |   4 +
 drivers/net/dsa/b53/b53_regs.h                     |   1 +
 drivers/net/dsa/b53/b53_srab.c                     |   2 +-
 drivers/net/dsa/bcm_sf2.c                          |   4 +
 drivers/net/dsa/mv88e6xxx/chip.c                   |   2 +-
 drivers/net/dsa/ocelot/felix.c                     |  13 +-
 drivers/net/ethernet/broadcom/asp2/bcmasp.c        |   2 +-
 drivers/net/ethernet/broadcom/bcm4908_enet.c       | 143 ++++++--
 drivers/net/ethernet/broadcom/bcmsysport.c         |  20 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |  47 +++
 drivers/net/ethernet/broadcom/genet/bcmgenet.c     |  19 +-
 drivers/net/ethernet/broadcom/tg3.c                |  43 ++-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c |   4 +-
 drivers/net/ethernet/google/gve/gve_rx_dqo.c       |  84 ++++-
 drivers/net/ethernet/intel/ice/devlink/devlink.c   |   2 +-
 drivers/net/ethernet/intel/ice/ice_tc_lib.c        |   3 +-
 .../net/ethernet/marvell/prestera/prestera_main.c  |  17 +-
 .../ethernet/mellanox/mlx5/core/en/tc_tun_encap.c  |   2 +-
 .../mellanox/mlx5/core/en_accel/en_accel.h         |   5 +-
 .../mellanox/mlx5/core/en_accel/ktls_txrx.h        |  21 ++
 drivers/net/ethernet/mellanox/mlx5/core/en_rx.c    |   2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c    |   7 +-
 drivers/net/ethernet/mellanox/mlx5/core/eswitch.c  |   3 +-
 .../mellanox/mlx5/core/steering/hws/fs_hws.c       |   2 +
 .../mellanox/mlx5/core/steering/sws/dr_icm_pool.c  |  32 +-
 drivers/net/ethernet/meta/fbnic/fbnic_csr.h        |   3 +-
 drivers/net/ethernet/meta/fbnic/fbnic_debugfs.c    |   3 -
 drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c    |  11 +
 drivers/net/ethernet/meta/fbnic/fbnic_hw_stats.c   |  24 +-
 drivers/net/ethernet/meta/fbnic/fbnic_hw_stats.h   |   1 +
 drivers/net/ethernet/meta/fbnic/fbnic_pci.c        |  16 +-
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c       |  93 ++++-
 drivers/net/ethernet/microsoft/mana/gdma_main.c    |   5 +
 drivers/net/ethernet/microsoft/mana/mana_en.c      |  76 +++--
 drivers/net/ethernet/microsoft/mana/mana_ethtool.c |  26 +-
 drivers/net/ethernet/pensando/ionic/ionic_dev.h    |   3 +-
 .../net/ethernet/pensando/ionic/ionic_ethtool.c    |   7 +
 drivers/net/ethernet/pensando/ionic/ionic_lif.c    |  10 +-
 drivers/net/netdevsim/ethtool.c                    |   9 +
 drivers/net/tun.c                                  |  70 +++-
 drivers/net/wireless/ath/ath10k/core.c             |   1 -
 drivers/net/wireless/ath/ath10k/thermal.c          |   9 +-
 drivers/net/wireless/ath/ath10k/thermal.h          |   2 -
 drivers/net/wireless/ath/ath10k/wmi.c              |   2 +-
 drivers/net/wireless/ath/ath9k/ar9003_paprd.c      |  10 +-
 drivers/net/wireless/ath/ath9k/ath9k.h             |   3 -
 drivers/net/wireless/ath/ath9k/beacon.c            |  10 +-
 drivers/net/wireless/ath/ath9k/htc.h               |   2 -
 drivers/net/wireless/ath/ath9k/htc_drv_beacon.c    |  10 +-
 drivers/net/wireless/ath/ath9k/wmi.c               |   5 +-
 drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c |   6 +-
 drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.h |   7 +-
 drivers/net/wireless/intel/iwlwifi/iwl-trans.c     |   1 -
 drivers/net/wireless/intel/iwlwifi/mvm/fw.c        |   3 +
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c       |  12 +-
 drivers/net/wireless/intel/iwlwifi/mvm/rx.c        |   4 +-
 .../net/wireless/intel/iwlwifi/tests/nvm_parse.c   |  24 +-
 drivers/net/wireless/realtek/rtw89/coex.c          |   3 +-
 drivers/ptp/ptp_vmclock.c                          |  63 +++-
 drivers/vhost/net.c                                |   2 +-
 include/linux/skbuff.h                             |   1 +
 include/linux/tcp.h                                |   3 +
 include/net/bluetooth/hci_core.h                   |   7 +
 include/net/bluetooth/l2cap.h                      |   5 +
 include/net/gso.h                                  |  33 ++
 include/net/inet_connection_sock.h                 |   5 +-
 include/net/mana/gdma.h                            |   6 +-
 include/net/mana/mana.h                            |   9 +-
 include/net/tcp.h                                  |  23 +-
 net/bluetooth/hci_core.c                           |  81 ++++-
 net/bluetooth/hci_debugfs.c                        |  32 +-
 net/bluetooth/hci_event.c                          |   9 +-
 net/bluetooth/hci_sync.c                           | 344 +++++++++++++++----
 net/bluetooth/l2cap_core.c                         |  33 +-
 net/bluetooth/mgmt.c                               | 377 ++++++++++++++++-----
 net/bluetooth/mgmt_config.c                        |   8 +
 net/bluetooth/mgmt_util.c                          |  23 +-
 net/bluetooth/msft.c                               | 118 +++++--
 net/bluetooth/smp.c                                |  58 +++-
 net/can/bcm.c                                      | 114 +++++--
 net/can/isotp.c                                    |  81 +++--
 net/can/raw.c                                      |  41 +--
 net/core/dev.c                                     |   4 +-
 net/core/net_test.c                                |  51 +++
 net/core/skbuff.c                                  |  34 +-
 net/core/sock.c                                    |   7 +-
 net/dsa/tag_brcm.c                                 |   7 +-
 net/ipv4/af_inet.c                                 |   2 +-
 net/ipv4/inet_connection_sock.c                    |   1 +
 net/ipv4/ip_fragment.c                             |   2 +
 net/ipv4/syncookies.c                              |   7 +
 net/ipv4/tcp.c                                     |   4 +-
 net/ipv4/tcp_ao.c                                  |  14 +-
 net/ipv4/tcp_offload.c                             |  10 +-
 net/ipv4/tcp_timer.c                               |   3 +-
 net/ipv4/udp.c                                     |  25 +-
 net/ipv4/udp_offload.c                             |   5 +-
 net/ipv6/af_inet6.c                                |   4 +-
 net/ipv6/calipso.c                                 |   5 +-
 net/ipv6/fib6_rules.c                              |   6 +
 net/ipv6/mcast.c                                   |  10 +-
 net/ipv6/syncookies.c                              |   6 +
 net/ipv6/tcpv6_offload.c                           |  11 +-
 net/kcm/kcmsock.c                                  |  16 +-
 net/key/af_key.c                                   |   9 +-
 net/l2tp/l2tp_netlink.c                            |  10 +-
 net/mptcp/mptcp_diag.c                             |  28 +-
 net/mptcp/options.c                                |  23 +-
 net/mptcp/protocol.c                               |   4 +-
 net/mptcp/protocol.h                               |   6 +-
 net/mptcp/subflow.c                                |   2 +-
 net/packet/af_packet.c                             |  40 ++-
 net/qrtr/ns.c                                      |  21 +-
 net/sctp/outqueue.c                                |   7 +-
 net/tipc/socket.c                                  |  10 +-
 net/tls/tls_main.c                                 |   9 +-
 net/vmw_vsock/vmci_transport.c                     |   6 +
 net/vmw_vsock/vsock_bpf.c                          |  45 ++-
 net/xdp/xsk.c                                      |   5 +-
 net/xfrm/xfrm_interface_core.c                     |   8 +
 tools/testing/selftests/drivers/net/stats.py       |  25 +-
 tools/testing/selftests/net/af_unix/scm_pidfd.c    |  51 +++
 tools/testing/selftests/net/netfilter/nft_fib.sh   |  90 +++++
 tools/testing/selftests/net/tls.c                  |  40 +++
 134 files changed, 2636 insertions(+), 768 deletions(-)

