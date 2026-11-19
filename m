Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106806;
	b=W+fy6A8EzZf7gsXlYivxYIaHmWbiBeopHTXvDyW9r+kEauiCkvyeQVFOQ8Ny1ihM9qlo
	 1Ev3sVXN7DRSS0pZLxlS9y+rpayhTM4pRlkDG3YcMK4QsMPzYqLNZc2nRKIuRh44Ysd2e
	 Bj6Q7pS2UxuKhEgosY815O9DoLAfHMjEBbJzsoqWD3hGfBnENTi2aEQ7t6hNBl4latpNa
	 9Wh75OVE8fmqczBuUEwmZ+hLjZ5c1ghKmfxYV/RsEdw+S6TUYar2k4S/D1bTQubCERKKv
	 pkaoPpq0+jm3aMng8YPmVWxoW9kX9GYi4U0uOZLvKj1FWW28nM1/XWDRItJ7IC7yN3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106806;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8n9JWXzWKC9AYv4CcD6AZD1GN/4B5l6gcvrVVW9wIrc=;
	b=eEVfSBpfDYkUSa74j5JyJ9OhFq9l6WlHC8+9DnUpoT+OmMcAbx5Uw3A9WH3joWpbulrb
	 ReKaFdm4bthglZkk+AsTbwLH3damN+LqmpNHq8aTBGTz3Dk0ZWrJ4bOCxmOp9inZSjXIh
	 /GsRMGX4OliIkPLjvz03NNKt9a3p8Vkzh0eLNqBqCUuzLtnDbcty0vMQIYqiho5lSS3M9
	 epRfPD7HzUoIlHWzzTS6593zRsTyt8F7QxX4zou9iWiGz50OWB7J2VBQ1kdk1ujvbO/I6
	 rmq2nj/j95xZmy++R5PTDKja2ltLxpuR6jHy9vq3l5wHIIHvALl07e3EaexRD48TTbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kMArzjx9;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3F8606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C3F8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kMArzjx9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795106806; x=1826642806;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kYpzxDAyZzk5DkPCaUbpaMdkHxo953ZE72WVRqgDW5E=;
  b=kMArzjx92lUoL5MRvne99Aq1CxyrdNJIbSOvwp+tBL95N4LQJ3AhEw/x
   ZVwb9HPfwbjkdlqhC3t0cbOzixur/W/kQaD9tRAeJwdGRapCnpNRkQM/c
   Tg2RZIH1Ke0e+/gaESHFk7WcHj24o1Mef2GIXVkhwt9yrSHxWnXbJ4ZGW
   BEvUIWhS7HvVx3jTZEM8QAn0gfhaV8VscKmZc6e3wYj6bK5J4fKHH5kXb
   AhMXSiQ8e5YmxfPOw92Jpjsmm07hvzHhsTRkvaX3pPRJuRTrQDkYjzARY
   JNg+lvIIqB83QANFNJS6yoeC2rIInekKu9DjW9mFe4mIxDUDl7v72swBf
   A==;
X-CSE-ConnectionGUID: pfacM2ipTGShWkenoMracw==
X-CSE-MsgGUID: jykMqhM8QGKynJIuMAhLhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3991059"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3991059"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:46:43 -0800
X-CSE-ConnectionGUID: OGubzTH2RxC82+RIfb9T/Q==
X-CSE-MsgGUID: 2o2Sy3aoSoaiIg5B0zBC6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10843329"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2026 08:46:41 -0800
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
Subject: [PATCH v5 net-next 00/13] selftests: net: adjust xskxceiver to drv-net
Date: Thu, 19 Nov 2026 17:46:23 +0100
Message-Id: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
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
runs one case per invocation, and test_xsk.sh, which ran all cases in
one, is removed (6). Finally, the RX and TX endpoints become separate
processes that meet over a small TCP control channel (7).

Patch 8 makes the endpoints send UDP over IPv4 or IPv6 between the
interface MACs, on veth as on hardware, and lets the XDP programs pass
all other traffic to the stack. Patch 9 adds what endpoints on two
hosts need, and patch 10 groups the test table by endpoint role and
lists each case with its roles in xskxceiver -l. Patch 11 decouples the
local link setup of NetDrvEpEnv from netdevsim. Patch 12 adds
drivers/net/xsk.py, which runs the cases over veth or on a NIC, and
patch 13 documents both setups.


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
 tools/testing/selftests/drivers/net/xsk.py    | 562 +++++++++++
 tools/testing/selftests/net/Makefile          |   2 -
 tools/testing/selftests/net/lib/Makefile      |   4 +-
 .../testing/selftests/net/lib/xsk/README.rst  | 225 +++++
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 879 +++++++++++-------
 .../testing/selftests/net/lib/xsk/test_xsk.h  | 150 ++-
 tools/testing/selftests/net/lib/xsk/xsk.c     |  66 +-
 tools/testing/selftests/net/lib/xsk/xsk.h     |   4 +-
 .../testing/selftests/net/lib/xsk/xsk_peer.c  | 339 +++++++
 .../testing/selftests/net/lib/xsk/xsk_peer.h  |  21 +
 .../selftests/net/lib/xsk/xsk_xdp_common.h    |   3 +-
 .../selftests/net/lib/xsk/xsk_xdp_progs.bpf.c |  91 +-
 .../selftests/net/lib/xsk/xskxceiver.c        | 509 ++++++----
 tools/testing/selftests/net/test_xsk.sh       | 251 -----
 tools/testing/selftests/net/xsk_prereqs.sh    |  93 --
 20 files changed, 2325 insertions(+), 957 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/xsk.py
 create mode 100644 tools/testing/selftests/net/lib/xsk/README.rst
 create mode 100644 tools/testing/selftests/net/lib/xsk/xsk_peer.c
 create mode 100644 tools/testing/selftests/net/lib/xsk/xsk_peer.h
 delete mode 100755 tools/testing/selftests/net/test_xsk.sh
 delete mode 100755 tools/testing/selftests/net/xsk_prereqs.sh


base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
-- 
2.43.0

