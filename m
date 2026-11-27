Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791956;
	b=UUS1idXfmFwRuEJDzhsQUaodPHayJHRld+Wy9ig/FLdn+RWD5ttqO7gxqA4UxGcqR5aV
	 Qe7sReZwaEjTc+A5MS18sJv2VvutvAPlFIkbjDHKzwlek1F21IUok9+2J7EwCVfCSQVyJ
	 CoBIqD2LBRvXXfsSKcvxSgE5Lx2l0TosadpAV85tX0YC/59OU+LkYQe3Eaxt/Yt8gvSzh
	 OL/UfwnsbKChH9IN+/paWvaucFcwNCYbEGZ01KGbjmQ/Vv6RbUTSnC3PDDEEz8cIw0keW
	 cEXCXyzckr70v8Zf/b+zrKAiFN+succGdwy7Ocu286NFbnLFag5yNdUC8XgXtWDNevQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791956;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tUMH5Nnj2ym7Y7xKItom/YX51tYtaFVM580wp9fFU5I=;
	b=dind49TVRKKP3QkdRf1TznFdCDWgXFuXCWh5HGrsKTE7ahiyLABmM/tDTZzienqdPzT3
	 mgmi9RGy8WcT3oUMaeEqBhTIABHh5j52pwz6HDMh7xnJWQYijUhLkqtgf507fJWhDwH5c
	 +IXk3P5QUofshEBazm7vHjINuKOWlcsnfxCTkJhLKuqGr+wmW32tJSX80sDeEjjf7neC3
	 hwipPGcWnuKTgjj1d94uEj5qVBuwVFs6MNC3Dh3zw7vmmvrkBtfFT/OYLQQvwutWG6159
	 6Ir/lpSy3h8rprhm1R05WVD0xg1aAAKtDekkd36zyC41iQ7pWwHF6W/hmyoyZ2SfGJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PLsTMyY3;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF5F606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF5F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PLsTMyY3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791954; x=1827327954;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C+ss9yETrJzWBolofXz5DfHY/J6mSDTq3ANdst6DSY0=;
  b=PLsTMyY30sX48Yko6GjwnxlG2OpY56v2JxKuOOap825On5s/ICodEm8/
   8ZYn/+/ZWsX2WdccBMOVfTXgkMkHA9ZopIXYZvFruAvaiIxK82tnx3j9V
   w1ZVW5fFVNkMc+dEip1bEeJ4BpCj3UfzmqFjyLbkoZFFLvEbP5Dw2TOq+
   BxjkPjN6Gr4wYYNgaQAA8jV70M6hqP9vK/QX3mCDLRnhRX9FxASIiyzjC
   NKlXAomqQPtXbnpZLH0yVOkyCqDOUNpbL+RRQNtKTwXxUrFjCo0D5jQ+A
   m4dlJAfke2TLDfwqibYggOIdUeajPDebi621q4PeJsXQK3SRGV/yHPR58
   Q==;
X-CSE-ConnectionGUID: AzpE2gdkRKCPLOlGZ1g0Mw==
X-CSE-MsgGUID: k+FV77K3SUeabVjhHR3Msg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4665954"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4665954"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:05:47 -0800
X-CSE-ConnectionGUID: m+jYFvJ7QommtNDqVIOfHw==
X-CSE-MsgGUID: 15QLY4YwSZSlqcUzBbsOTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12202594"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:05:45 -0800
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com,
	stfomichev@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tushar.vyavahare@intel.com,
	kerneljasonxing@gmail.com,
	bjorn@kernel.org,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [PATCH v6 net-next 00/15] selftests: net: adjust xskxceiver to drv-net
Date: Fri, 27 Nov 2026 16:05:12 +0100
Message-Id: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v5:
https://lore.kernel.org/netdev/20261119164636.1071385-1-maciej.fijalkowski@intel.com/
v5->v6:

- new patch 1: stack overrun fix split out of patch 9 (Sashiko)
- new patch 11: poll the RX stats, a single read was flaky in CI (Jakub),
  and retry a busy queue bind for up to --timeout seconds
- new patch 13: rename nsim_test to sw_test (Jakub)
- drop the README patch (Jakub)
- use NetDrvEpEnv(sw_drv="veth") (Jakub)
- busy poll over veth too (Jakub)
- set up huge pages, RSS, ntuple and busy poll per case (Jakub)
- reset RSS over netlink, drop the queue-out-of-RSS check (Jakub)
- use ctl_file_write(), set_ethtool_feat(), ethtool(), ksft_pr() (Jakub)
- steer the control connection to DUT queue 0 (Sashiko)
- fall back to IPv4 if IPv6 ntuple rules are rejected (Sashiko)
- detach XDP and restore MTU after every case (Sashiko)
- mark the tests disruptive (Sashiko)
- xskxceiver fixes: multi-buffer in SKB mode (if max MTU allows), link
  wait, MTU restore, XDP cleanup, POLL_TXQ_FULL, --udp-port and --queue
  checks, huge page probe, TX bind before READY (Sashiko)

v4:
https://lore.kernel.org/netdev/20261016174338.787135-1-maciej.fijalkowski@intel.com/
v4->v5:

- merge drivers/net/hw/xsk.py and net/test_xsk.py into
  drivers/net/xsk.py (Jakub)
- make variables used for netdevsim addrs generic and reuse for veth
- drop net/lib/py/xsk.py and keep its helpers in xsk.py (Jakub)
- use and rely on bkg() and cmd() instead of home-grown solutions
  (Jakub)
- make xsk.py pylint and ruff clean (Jakub)
- single test cases listing for both scenarios (hw/sw)
- skip busy_poll for veth; NAPI id is not exposed there (yet)
- skip HW_SW_MAX_RING_SIZE when the HW TX ring has 8 descriptors or
  fewer (Sashiko)
- reject --timeout outside 1-0xffff and --max-frags above 0xffff in
  xskxceiver (Sashiko)
- turn on ntuple filters before taking the DUT queue out of RSS, and
  fail a case after which the queue is back in RSS, as on ixgbe (Sashiko)

v3: https://lore.kernel.org/netdev/20261014184539.774708-1-maciej.fijalkowski@intel.com/
v3 -> v4:
- add tags from Mr Björn
- drop --hw in xskxceiver, align packet layout between hw/veth runners (Björn)
- drop parse_u32() in xskxceiver (Björn)
- move ethtool -G and ring sizing logic from C to python
- configurable --timeout (Björn)
- keep the HW_SW_MAX_RING_SIZE batch below the XSK TX ring size (Sashiko)
- restore hugepage count in veth runner on exception paths (Sashiko)
- use ExitStack in hw runner to cover setup unrolls (Björn, Sashiko)
- support IPv6 next to IPv4 (Björn)
- send to the next-hop MAC, the peer need not be on-link (Björn)
- make --listen work on its own rather than follow the TX role (Björn)
- run XDP_SHARED_UMEM on HW, the socket is picked by UDP source port
- fail a case when one endpoint fails and the other skips (Björn)
- keep the TX half of the unaligned check in the xsk_caps conversion
- detach in cleanup_iface() with the flags of mode_to_xdp_flags()
- reserve 2 MiB huge pages, tolerate hosts without hugetlb or root (Sashiko)
- lower the veth case timeout to 20s, within the net timeout (Sashiko)
- guard pkts_in_flight against forged PROGRESS reports (Sashiko)
- log short fragments, fix the IPv4 fragment comment (Sashiko)
- keep the MIN_PKT_SIZE and PKT_HDR_SIZE names to cut churn
- read what a gone peer left at READY, drain after a SKIP (Sashiko)
- cap --max-frags, which sizes a packet array (Sashiko)
- skip the hw run when RSS or ntuple setup is refused (Sashiko)
- bound the gateway ping, fail clearly without its MAC (Sashiko)
- note in the README that RFS has to stay off on the DUT (Sashiko)

v2: https://lore.kernel.org/netdev/20261008114909.734364-1-maciej.fijalkowski@intel.com/
v2 -> v3:
- new patch: size the TX UMEM of HW_SW_MAX_RING_SIZE like the RX one
- replace test_xsk.sh with test_xsk.py, a veth pair per case (Sashiko)
- add busy-poll variants to both runners
- wait for the listener's stderr line instead of polling with ss
- default MTU of 1500, wait for link after MTU/XDP changes (Sashiko)
- fill the fill ring before bind, as zero-copy drivers need
- xskxceiver -L lists HW cases, replacing test_xsk_case_defs.h (Jakub)
- run more cases on HW, e.g. TEARDOWN and HW_SW_{MIN,MAX}_RING_SIZE
- follow drv-net conventions in xsk.py, drop XSK_* variables (Jakub)
- set up queue, ntuple and huge pages once per run
- build, ring reset, control channel, XDP and xsk.py fixes (Sashiko)
- document both runners with a netns remote example

v1: https://lore.kernel.org/netdev/20261001202124.692591-1-maciej.fijalkowski@intel.com/
v1 -> v2:
- rebase on net-next, NIPA could not apply v1 (Stanislav)
- new patch: pass non-test traffic to the stack on HW (Stanislav)
- support a netns remote, like NIPA's E810/X710 setup (Stanislav)
- drop XSK_STATIC, link xskxceiver dynamically
- fail TX when RX exits with packets in flight
- fix IPv4/UDP lengths in verbatim multi-buffer streams
- build fixes for a failing or broken bpftool
- document both remote types and the traffic filter


Hi,

[0] moved the AF_XDP test suite from selftests/bpf to selftests/net.
This series hooks it up to drv-net, so that it runs over veth in SW CI
and on a NIC in HW CI; so far our HW runs have been manual. We keep the
existing xskxceiver cases rather than start from scratch.

xskxceiver ran the RX and TX sides of a case as two threads of one
process. drv-net needs a process per side, so each endpoint becomes a
process of its own, and the two talk over xsk_peer, a small TCP control
channel: READY separates the steps, PROGRESS paces TX by what RX has
consumed, ABORT stops the peer after a failure, and SKIP makes the peer
skip a case that its endpoint skips.

drivers/net/xsk.py runs each case between a local and a remote
endpoint. The remote one is always an SKB-mode xskxceiver, so the remote
needs no zero-copy support, and both ends share the packet generation
and validation of the cases.
- Without NETIF, they run over a veth pair, the remote end in a
  namespace, with the local endpoint receiving in SKB and DRV mode
  (skb_<case> and drv_<case> variants).
- With NETIF, the local endpoint runs in zero-copy mode once per role
  that xskxceiver -l lists for the case (rx_<case> and tx_<case>), e.g.
  rx_SEND_RECEIVE tests ice_clean_rx_irq_zc() and tx_SEND_RECEIVE
  ice_xmit_zc(). ntuple rules steer the test flow to the AF_XDP queue.
Every case also runs with the local endpoint busy polling. The single
interface (loopback) mode is removed.

Over veth, the cases that cannot pass are expected failures without
being run: XDP_ADJUST_TAIL_SHRINK_MULTI_BUFF and the XDP_ADJUST_TAIL_GROW
cases, which hit veth and generic XDP limits, and
HW_SW_{MIN,MAX}_RING_SIZE, as veth has no rings. We can keep them, drop
them or run them on HW only. The UNALIGNED cases are expected failures
without huge pages.

Patch 1 fixes a stack overrun, 2-4 prepare the split, 5-8 make the
endpoints separate processes and remove test_xsk.sh, 9-12 adapt the
endpoints to two hosts and list the roles of each case, 13-14 prepare
NetDrvEpEnv for veth, and 15 adds xsk.py.

Known issues:
- On ice, the RSS reset over netlink fails without [1], which NIPA
  already carries.
- BIDIRECTIONAL, STAT_RX_DROPPED and TX_QUEUE_CONSUMER do not run on
  HW. I think BIDIRECTIONAL can go, as the rx_ and tx_ variants cover
  both directions.

Thanks,
Maciej

[0]: https://lore.kernel.org/netdev/20261109193048.1006986-1-maciej.fijalkowski@intel.com/
[1]: https://lore.kernel.org/netdev/20261123205600.1794292-2-kuba@kernel.org/

Maciej Fijalkowski (15):
  selftests: xsk: fix the stack overrun in is_adjust_tail_supported()
  selftests: xsk: factor endpoint work out of pthread wrappers
  selftests: xsk: size the TX UMEM in HW_SW_MAX_RING_SIZE
  selftests: xsk: drop the single-interface loopback mode
  selftests: xsk: collect interface capabilities in struct xsk_caps
  selftests: xsk: split xskxceiver main() into setup, run and cleanup
  selftests: xsk: run one test case per xskxceiver invocation
  selftests: xsk: run the RX and TX endpoints in separate processes
  selftests: xsk: send UDP over IPv4 or IPv6 between the interface MACs
  selftests: xsk: prepare xskxceiver for endpoints on two hosts
  selftests: xsk: wait up to --timeout for the RX stats and a busy bind
  selftests: xsk: list the endpoint roles of the test cases
  selftests: drv-net: rename nsim_test to sw_test
  selftests: drv-net: decouple local link setup from netdevsim
  selftests: drv-net: run the AF_XDP tests over veth or a NIC

 MAINTAINERS                                   |    2 +-
 tools/testing/selftests/drivers/net/Makefile  |    1 +
 tools/testing/selftests/drivers/net/config    |    3 +
 .../testing/selftests/drivers/net/hw/csum.py  |    2 +-
 .../drivers/net/hw/devlink_rate_cross_esw.py  |    2 +-
 .../drivers/net/hw/devlink_rate_tc_bw.py      |    2 +-
 .../selftests/drivers/net/hw/gro_stats.py     |    2 +-
 .../selftests/drivers/net/hw/ipsec_vxlan.py   |    2 +-
 tools/testing/selftests/drivers/net/hw/irq.py |    2 +-
 .../selftests/drivers/net/hw/nic_timestamp.py |    2 +-
 .../selftests/drivers/net/hw/ntuple.py        |    2 +-
 .../testing/selftests/drivers/net/hw/pause.py |    2 +-
 .../selftests/drivers/net/hw/pp_alloc_fail.py |    2 +-
 .../selftests/drivers/net/hw/rss_api.py       |    2 +-
 .../selftests/drivers/net/hw/rss_ctx.py       |    2 +-
 .../drivers/net/hw/rss_flow_label.py          |    2 +-
 .../drivers/net/hw/rss_input_xfrm.py          |    2 +-
 tools/testing/selftests/drivers/net/hw/tso.py |   10 +-
 .../selftests/drivers/net/hw/xsk_reconfig.py  |    2 +-
 .../selftests/drivers/net/lib/py/env.py       |   83 +-
 .../selftests/drivers/net/perf/devmem.py      |    2 +-
 .../selftests/drivers/net/perf/iperf.py       |    2 +-
 tools/testing/selftests/drivers/net/xsk.py    |  453 ++++++++
 tools/testing/selftests/net/Makefile          |    2 -
 tools/testing/selftests/net/lib/Makefile      |    4 +-
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 1009 +++++++++++------
 .../testing/selftests/net/lib/xsk/test_xsk.h  |  151 ++-
 tools/testing/selftests/net/lib/xsk/xsk.c     |  134 ++-
 tools/testing/selftests/net/lib/xsk/xsk.h     |    5 +-
 .../testing/selftests/net/lib/xsk/xsk_peer.c  |  339 ++++++
 .../testing/selftests/net/lib/xsk/xsk_peer.h  |   21 +
 .../selftests/net/lib/xsk/xsk_xdp_common.h    |    3 +-
 .../selftests/net/lib/xsk/xsk_xdp_progs.bpf.c |   91 +-
 .../selftests/net/lib/xsk/xskxceiver.c        |  564 +++++----
 .../selftests/net/lib/xsk/xskxceiver.h        |    1 -
 tools/testing/selftests/net/test_xsk.sh       |  251 ----
 tools/testing/selftests/net/xsk_prereqs.sh    |   93 --
 37 files changed, 2215 insertions(+), 1039 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/xsk.py
 create mode 100644 tools/testing/selftests/net/lib/xsk/xsk_peer.c
 create mode 100644 tools/testing/selftests/net/lib/xsk/xsk_peer.h
 delete mode 100755 tools/testing/selftests/net/test_xsk.sh
 delete mode 100755 tools/testing/selftests/net/xsk_prereqs.sh


base-commit: ccb81d5e317b0ae2cc66ca1c628c0ca907928f94
-- 
2.43.0

