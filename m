Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952627;
	b=Y1bMCbIHiHU3M3D2VDUFFDPwM2JZtVm+Yak+TX7T8SRCTHJqwOm2KtMJ8xNulINikkUo
	 gFz1FpAC8k+wWKt1eF84SlLeYwpF3JeYPH8TuvsDsPKsz9UZ9oLYAZcbqFC44/98WCKPB
	 O9F79GJzhmgXPsIA6fey23WO3llVzPzcZPUavoOOiTf0d2CTnCVbEPrGqDP1x5/89DS9P
	 CikRx/pbHCnlkIAp16edOyK1Dv+WIu59V7/I0Ur3Ij25NJRmixbTd1VvcQr7TADZ6epsr
	 114OEAy4g5ArH7k4/VZyBeVU7ycuIYM40tzswgck5zLHhHATKFXKkaE8zhbqm8Dnolw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952627;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fP2dDqa1hc+q9jRUD4lIQy9b9Ky0P+35U8/Bf6Sm/kk=;
	b=JmXUEC4AFmjn6wLB0RR72p14ihUIVdGttBRw4RoOB8WSoPJUSsGvMC5psBGWZnSCc/KS
	 uBWyLZ9/3WEpz2hjpv0MAiNvFaA8hlI6bV6Ib9R9Q2TDn4nkEbGgUxBIwqEI5BgKrBQmE
	 MU3XcGzf6LglrKyhEI8KSuYxCiw1/BmEN/DCSQWyJuR/oz5yx9olUlcH1EpHbxlUTKn4B
	 ckUgSf7Ftw0C0x5mi6qfWyZ/YsDKkMUodFArxjyJ0SRLnOBSN40Za9eyZ2gMdu3Gd6+Pb
	 ufdcnq0xkbJpFISZY5ylXRbrgQbajCFeDQ0NARgV84bYRblPIuWREbk3NlOi/W8wNRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d3SLEMNH;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A2C606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A2C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d3SLEMNH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794952628; x=1826488628;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yFKGwVOroDEvkWeANQ4uv1C8z7BULBRJnFwsrXuE/30=;
  b=d3SLEMNHWQpL0Pq4cstkBJ9dNT1E+jAr6gpbCcqkve6Mgeq5ge3H7+pl
   Y6bqFF/a6oZhBtaP2V29xX5MNBJ1NKjIOP5aSRK41WLBqaPP59NkGXZjo
   GK4U+wRsAgUaD7UQj4g1ZXmM7aaYTFHBZfQtNhO42gK6+acB1bJ8div/e
   0URGE7L/pfqXHZ0XThTDaNtTxE9SjhlEldSBJGCWbdhJlrlORo3H992dA
   WQP0hcHSstJO44oQGBX8yJXi45T8yJZ3nrhI0wNOrzH0sPMBb8jVwcnpO
   G73J9N92NNAUf06iND02QMrndXg94XAi4yt6jLWaysuMg5VsNIyUGB4/S
   w==;
X-CSE-ConnectionGUID: tpNZzLkuTymzNqzftXtqww==
X-CSE-MsgGUID: THEuhGn5QHyPGe2fadiFSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3638656"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3638656"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 13:57:07 -0800
X-CSE-ConnectionGUID: cDtOEiZUTeePCZ6+jSpHUw==
X-CSE-MsgGUID: 3yfYjTIbRQ2qHpjxqHKzxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9916027"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2026 13:57:05 -0800
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: maciej.fijalkowski@intel.com,
	netdev@vger.kernel.org
Subject: [PATCH v5 net-next 00/13] selftests: net: adjust xskxceiver to drv-net
Date: Tue, 17 Nov 2026 22:56:51 +0100
Message-Id: <20261117215704.1059198-1-maciej.fijalkowski@intel.com>
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

v4:
https://lore.kernel.org/netdev/20261016174338.787135-1-maciej.fijalkowski@intel.com/
v4->v5:

* Rebase on top of [0], which moved the suite to selftests/net with
  v4's patches 4-6 and took the Makefile review there (Jakub).
* Merge drivers/net/hw/xsk.py and net/test_xsk.py into
  drivers/net/xsk.py. Without NETIF, it runs over a veth pair from the
  new NetDrvEpEnv(veth_test=True), shared by all cases, and the cases
  that veth cannot pass are reported as XFAIL, so that SW CI is green
  (Jakub). The env keeps veth_test as an attribute, which xsk.py
  checks. With NETIF, veth_test has no effect, and it conflicts with
  nsim_test=True.
* New patch 11 renames the netdevsim address prefixes of NetDrvEpEnv
  to sw_v4_pfx and sw_v6_pfx, and moves the address and link setup of
  the local pair into _setup_sw_ifaces(), which the veth pair reuses.
* Drop net/lib/py/xsk.py and keep its helpers in xsk.py (Jakub).
* Start the endpoints with bkg() and cmd(). The local endpoint now
  listens and signals it with ksft_ready() rather than a stderr line
  (Jakub), and stops waiting for its peer after 10s rather than 30s.
* Make xsk.py pylint and ruff clean (Jakub).
* Replace xskxceiver -L with the roles that -l now lists after each
  case, so that one list serves the veth and the NIC run. The remote
  endpoint always runs in SKB mode and does not busy poll; over veth,
  the local endpoint receives in SKB or DRV mode.
* Run test_xsk_busy_poll on a NIC only, as veth gives an AF_XDP socket
  no NAPI to busy poll, and create the veth pair with a single queue.
* List the UNALIGNED cases and TOO_MANY_FRAGS on any NIC. Without huge
  pages, the UNALIGNED cases are XFAIL over veth and on a NIC alike, and
  on a DUT without multi-buffer zero-copy, xskxceiver skips
  TOO_MANY_FRAGS like the other multi-buffer cases.

v3: https://lore.kernel.org/netdev/20261014184539.774708-1-maciej.fijalkowski@intel.com/
v3 -> v4:
- add tags from Mr Björn
- Drop --hw in xskxceiver, align packet layout between hw/veth runners (Björn)
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
This series hooks it up to the python-based drv-net infrastructure, so
that it runs over veth in SW CI and on a NIC in HW CI. Since a non-zero
effort went into implementing xskxceiver's (not so great testing app
name) test cases, we did not want to completely abandon it and start
everything from scratch within different infra. However, hooking it up
to the networking CI will allow us to run cyclic tests on real HW;
before that, all of our HW tests were manual local runs.

Tests were based on a process with two threads responsible for the RX
and TX paths, whereas the new infra expects two separate processes for
the DUT and remote side, where each side has either rx or tx role.

To satisfy this requirement, this series makes each xskxceiver endpoint
a process of its own, so that the RX and TX sides of a case can run on
different hosts, and adds drivers/net/xsk.py, which runs the existing
test cases between the local and the remote interface. Without NETIF,
these are a veth pair with the remote end in a network namespace, and
the cases run in SKB and DRV mode, as test_xsk.sh did, with the local
endpoint receiving in that mode. Unlike test_xsk.sh, the veth run does
not busy poll: veth does not tie its NAPI instances to its queues, so
xsk_bind() finds no NAPI ID for a socket on it. With NETIF, the DUT runs
in zero-copy mode, with and without busy polling, against a remote host
or the peer port of the same host in a network namespace. In both
setups, the remote endpoint is an SKB-mode xskxceiver that does not busy
poll.

ZC tests used to expect a single NIC in loopback mode, with both
sockets on one of its queues sharing a UMEM. Now we step away from it:
the DUT and the remote are separate interfaces, on two hosts or on one
host with the remote in a namespace, and an ntuple rule steers
the test traffic to the AF_XDP queue.

The remote endpoint is xskxceiver in SKB mode rather than a plain
socket, so both ends keep sharing the packet stream generation and
validation of the existing cases. This reduces the need for remote
interface being a NIC from narrow set of NICs that are AF_XDP ZC
capable.

This implies that during the test run only one side is actually
exercised, so let's introduce the concept of direction per test case.
For example, this means rx_SEND_RECEIVE will test the
ice_clean_rx_irq_zc() routine and tx_SEND_RECEIVE the ice_xmit_zc().

The single interface mode, which was used for ZC tests, is removed. The
veth run is kept, as it is the only run that needs no hardware and not
all tests are currently covered by the HW test side. The cases that
cannot pass over veth are reported as expected failures, so that a SW
run passes: XDP_ADJUST_TAIL_SHRINK_MULTI_BUFF, which leaks page_pool
pages on veth and in generic XDP, the XDP_ADJUST_TAIL_GROW cases, as
veth and generic XDP leave no room to grow most frames and cannot grow
frags, and HW_SW_{MIN,MAX}_RING_SIZE, as veth has no rings to size. We
can decide whether to keep the delta test cases, drop them or somehow
enable within HW tests.

Thread-based approach had a pacing mechanism that was a simple in-flight
packet counter updated within critical section by both ends.
Process-based way now is going to do this pacing via xsk_peer.

xsk_peer, the control channel, carries four fixed-size messages: READY
is the barrier between steps, PROGRESS tells TX how many packets RX has
consumed so that TX does not overrun the RX UMEM, ABORT stops the peer
after a failure, and SKIP makes the peer skip a case that its endpoint
skips.

The test table in test_xsk.h is grouped by the endpoint role that each
case tests, which a hardware run gives to the DUT: RX, TX, both, or
none for the generic cases, which run on veth only. xskxceiver -l lists
each case with its roles, e.g. "0: SEND_RECEIVE rx tx", so that one list
serves both runs. On a NIC, xsk.py makes ksft_variants() named
rx_<case> and tx_<case>, one per listed role, so -t, -T and -l work as
for any other test. Over veth, it runs every listed case, in variants
named skb_<case> and drv_<case> after the mode of the local endpoint.
A copy-mode socket sends alike in both modes, so the remote sends in
SKB mode as a DRV-mode one would. In both setups, the UNALIGNED cases
are expected failures when xsk.py cannot reserve huge pages for them on
both hosts.


Patches 1-3 prepare the split. Patch 1 moves the endpoint work out of
the pthread entry points. Patch 2 sizes the TX UMEM of
HW_SW_MAX_RING_SIZE like the RX one, as the case only worked with the
UMEM that the single-interface mode shares. Patch 3 drops the
single-interface loopback mode, which cannot work with one endpoint per
process.

Patches 4-7 split the engine. The interface capabilities move into one
struct, so that a process can mirror them for the endpoint it does not
own (4). main() is split into setup, run and cleanup (5). xskxceiver
runs one case per invocation, and test_xsk.py, which replaces
test_xsk.sh, owns the mode x case matrix (6). Finally, the RX and TX
endpoints become separate processes that meet over a small TCP control
channel (7).

Patch 8 makes the endpoints send UDP over IPv4 or IPv6 between the
interface MACs, on veth as on hardware, and lets the XDP programs pass
all other traffic to the stack. Patch 9 adds what endpoints on two
hosts need, and patch 10 groups the test table by endpoint role and
lists each case with its roles in xskxceiver -l. Patch 11 decouples the
local link setup of NetDrvEpEnv from netdevsim. Patch 12 replaces
test_xsk.py with drivers/net/xsk.py, which runs the cases over veth or
on a NIC, and patch 13 documents both setups.


Known issues:
- Every case pays for process start-up, XDP attach and detach and, on
  hardware, its remote commands. We used to configure resources once
  and then execute the whole test suite; it doesn't seem to be
  CI-friendly and it is preferred to have each case's resource
  management separated; that on the other hand increases the
  execution time of the whole test suite. Only what all cases share,
  the huge pages, the veth pair and, on hardware, the queue taken out
  of RSS and the ntuple rules, is set up once per run.

- The control channel goes between the local and the remote address,
  so it shares the tested link. A zero-copy TX socket fills no RX
  buffers and its queue would drop that traffic, so the DUT queue
  stays out of RSS in both directions, and a DUT with fewer than two
  queues skips the run.

- The control channel is unauthenticated TCP, and the local endpoint
  listens on the local address while its case runs.

- Both endpoints get only the case number, and the control channel
  does not check that they run the same case. xsk.py copies the DUT's
  xskxceiver to the remote with cfg.remote.deploy(), so that both ends
  number the cases alike.

- Not on hardware (yet, or ever):
 * BIDIRECTIONAL, which needs both directions set up in one case; i
   think it should be removed as we sort of achieve the bi-directional
   coverage via the rx_ and tx_ variants, and it currently does not fit
   our KISS-policy on remote side;
 * STAT_RX_DROPPED and TX_QUEUE_CONSUMER, which do not run in zero-copy
   mode.

Thanks,
Maciej

[0]: https://lore.kernel.org/netdev/20261109193048.1006986-1-maciej.fijalkowski@intel.com/

Maciej Fijalkowski (13):
  selftests: xsk: factor endpoint work out of pthread wrappers
  selftests: xsk: size the TX UMEM in HW_SW_MAX_RING_SIZE
  selftests: xsk: drop the single-interface loopback mode
  selftests: xsk: collect interface capabilities in struct xsk_caps
  selftests: xsk: split xskxceiver main() into setup, run and cleanup
  selftests: xsk: run one test case per xskxceiver invocation
  selftests: xsk: run the RX and TX endpoints in separate processes
  selftests: xsk: send UDP over IPv4 or IPv6 between the interface MACs
  selftests: xsk: prepare xskxceiver for endpoints on two hosts
  selftests: xsk: list the endpoint roles of the test cases
  selftests: drv-net: decouple local link setup from netdevsim
  selftests: drv-net: run the AF_XDP tests over veth or a NIC
  selftests: xsk: document generic and hardware endpoint runs

 MAINTAINERS                                   |   2 +-
 tools/testing/selftests/drivers/net/Makefile  |   1 +
 tools/testing/selftests/drivers/net/config    |   3 +
 tools/testing/selftests/drivers/net/hw/tso.py |   8 +-
 .../selftests/drivers/net/lib/py/env.py       |  69 +-
 tools/testing/selftests/drivers/net/xsk.py    | 526 +++++++++++
 tools/testing/selftests/net/Makefile          |   2 -
 tools/testing/selftests/net/lib/Makefile      |   4 +-
 .../testing/selftests/net/lib/xsk/README.rst  | 218 +++++
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 874 +++++++++++-------
 .../testing/selftests/net/lib/xsk/test_xsk.h  | 150 ++-
 tools/testing/selftests/net/lib/xsk/xsk.c     |  66 +-
 tools/testing/selftests/net/lib/xsk/xsk.h     |   4 +-
 .../testing/selftests/net/lib/xsk/xsk_peer.c  | 339 +++++++
 .../testing/selftests/net/lib/xsk/xsk_peer.h  |  21 +
 .../selftests/net/lib/xsk/xsk_xdp_common.h    |   3 +-
 .../selftests/net/lib/xsk/xsk_xdp_progs.bpf.c |  91 +-
 .../selftests/net/lib/xsk/xskxceiver.c        | 503 ++++++----
 tools/testing/selftests/net/test_xsk.sh       | 251 -----
 tools/testing/selftests/net/xsk_prereqs.sh    |  93 --
 20 files changed, 2271 insertions(+), 957 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/xsk.py
 create mode 100644 tools/testing/selftests/net/lib/xsk/README.rst
 create mode 100644 tools/testing/selftests/net/lib/xsk/xsk_peer.c
 create mode 100644 tools/testing/selftests/net/lib/xsk/xsk_peer.h
 delete mode 100755 tools/testing/selftests/net/test_xsk.sh
 delete mode 100755 tools/testing/selftests/net/xsk_prereqs.sh


base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
-- 
2.43.0

