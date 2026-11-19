Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106836;
	b=Zdu+yIl69Qild3JlhCqEXG1m+3OTZGid/7pm+XdypfMN62wStUa+QVm+hSI0tF3Oz9Fo
	 JGWmM0QoqnMPrf5wiIkO4QbTmRDXoLjJbXrx9Dt5cHDfKhaYoNDuAqUKkrc0waQ4eSwCP
	 wnu5KPhAv3x/e6pnuo+LO8aTs3Kn+Vcizqahi42yAyygZUWzTuWr/7YPT3aagsY70LUHD
	 aQ0lzb6n5Gzw6ZyBv+no2LPyfFX4oPxctWqQ2+2G974t9Q+qX6Pmq4rGkD2hcW/wm9aCg
	 Hk5T+VZhLRUuA/NjKuLN5wGv4GwHM+eeRqm3+WaLwbUp1BvFjcXAimU9I6Y6etq8Wmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106836;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bOlWzM8a5FGcR3Id485ia3FSq6Q5LQl3cmICg3iLpjY=;
	b=Gxmh82vJOqoxttAzTxt6+dIMgL9xuy9sb2bOW8nBPtaU31HXeTu8MHDK9AI+EVjPxqjg
	 +xOlGBzbtJNQZBtezBCZLg6ap6tH4ss86qtyrUlQXxNJNtqPV26tTR3AeEeCfg4e644g2
	 43cAtmCv9FXE3auDE6DyGo7zPJ3xPkXGWigj70sJjT0L93Ayx5+WMn2LX1GOE1IuuxhrZ
	 n9DJNQVALoDhXIddbM0qVcmr1B6NJX4HX6DObinIXXkYqekOMdWEPevEfEfExVnXraAiQ
	 +jHfW2SoIcUHdA9N/au80vYuxRUYLdBMr9W8l0c2SJbktPk784Wu+Nk57HKwPUptQbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LAXBeMza;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F6760A2616
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F6760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LAXBeMza
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795106836; x=1826642836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1CjeKjJiYdybIo5YQJXcCazrzrI4W/dITt1gb3l1l3Y=;
  b=LAXBeMzaxOi9A/og0DNbrQd+9lErdC+WU9AAFR9shzGxtJJnOX1Rvftb
   S3gNwYbjwGoUEIWCZTEY0U104jxwZ51z2O+eL8DKojvRQTprobV4CPUor
   SRpFsIt8OtNuBXgkFnuw0G4LrfG1UEZPodZDUAGOGAuMjysWf7fjrWxrQ
   HfEaahxin9mCj9sfbDfQurORNrUAeOpTot3PhXpejBQz2o7CwtZuMKwoK
   KTdl9Kjko1ZClGH4LOjS1faIB7e+l7MpYJUf4uEMgvmhiOl2JHjcxAE20
   4f3JcO8r69pi2VRh0Fa/qWkhKYs/wY4aJg41HirONKVO+whPtJ4x5/SxN
   A==;
X-CSE-ConnectionGUID: pYZSwqVsSOyfNoUz0QgKrQ==
X-CSE-MsgGUID: 4NTwpzsjS7C9We66PEWFfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3991215"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3991215"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:47:15 -0800
X-CSE-ConnectionGUID: JGNKtiVuTfWuntnyHwoxMQ==
X-CSE-MsgGUID: EzaUBXm0QV6xQDPbWXCk5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10843406"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2026 08:47:12 -0800
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
Subject: [PATCH v5 net-next 12/13] selftests: drv-net: run the AF_XDP tests over veth or a NIC
Date: Thu, 19 Nov 2026 17:46:35 +0100
Message-Id: <20261119164636.1071385-13-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
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

Add drivers/net/xsk.py, which runs each AF_XDP case as a pair of
xskxceiver processes, one on the local interface and one on the remote.
bkg() starts the local endpoint and waits for its ksft_ready(), then
cmd() starts the remote one, which connects to it. timeout(1) bounds
both, as cmd() and bkg() leave a hung command running. A case passes
when both endpoints pass, and is skipped when one skips and neither
fails. Only the output of an endpoint that does not pass is logged,
along with its command line. The remote endpoint always runs in SKB
mode and does not busy poll, so the remote needs no zero-copy support,
and only the local endpoint takes the mode and busy polling of a case.

Without NETIF, the endpoints run over a veth pair, and each case runs in
SKB and DRV mode, as test_xsk.sh did. The local endpoint receives in
that mode, and the remote one sends in SKB mode, as a copy-mode socket
sends alike in both modes. Unlike test_xsk.sh, the veth run does not
busy poll: veth does not tie its NAPI instances to its queues, so
xsk_bind() finds no NAPI ID for a socket on it, and the socket has
nothing to busy poll. The cases that veth cannot pass are reported as
expected failures, so that a SW run passes. For this, add a veth_test
parameter to NetDrvEpEnv, which then creates a veth pair instead of
netdevsim devices, with the peer in a namespace of its own as the
remote, and sets the veth_test attribute that xsk.py checks. With NETIF,
veth_test has no effect, and it conflicts with nsim_test=True.

With NETIF, the local endpoint runs in zero-copy mode, once in each role
that xskxceiver -l lists with a case, with and without busy polling.
xsk.py takes the DUT queue out of RSS, steers the test flow to the
receiving endpoint with an ntuple rule on each host, and sizes the rings
for HW_SW_{MIN,MAX}_RING_SIZE with ethtool -G. A DUT without zero-copy,
ntuple support or a second queue skips.

A TX endpoint in zero-copy mode fills no RX buffers, so its queue
drops what it receives, the control connection included. Turning
ntuple filters on can reset a NIC, so xsk.py does that before it takes
the queue out of RSS. ixgbe, for one, rebuilds its indirection table on
every reset, including those for the XDP, MTU and ring changes of a
case, so a case fails if the queue is back in RSS after it, rather than
timing out at random.

In both setups, the UNALIGNED cases are expected failures when xsk.py
cannot reserve huge pages for them on both hosts.

xsk.py runs the xskxceiver that net/lib builds and copies it to the
remote. As a SW run passes, list xsk.py in TEST_PROGS, unlike
test_xsk.sh, which ran every case. Add CONFIG_BPF_SYSCALL,
CONFIG_HUGETLBFS and CONFIG_VETH to the drivers/net config, add xsk.py
to MAINTAINERS and mention the hardware run in the header comment of
xskxceiver.c.

Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/drivers/net/Makefile  |   1 +
 tools/testing/selftests/drivers/net/config    |   3 +
 .../selftests/drivers/net/lib/py/env.py       |  40 +-
 tools/testing/selftests/drivers/net/xsk.py    | 562 ++++++++++++++++++
 .../selftests/net/lib/xsk/xskxceiver.c        |   3 +
 6 files changed, 603 insertions(+), 7 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/xsk.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 186554e49410..863f22449150 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30568,6 +30568,7 @@ F:	include/net/xsk_buff_pool.h
 F:	include/uapi/linux/if_xdp.h
 F:	include/uapi/linux/xdp_diag.h
 F:	net/xdp/
+F:	tools/testing/selftests/drivers/net/xsk.py
 F:	tools/testing/selftests/net/lib/xsk/
 
 XEN BLOCK SUBSYSTEM
diff --git a/tools/testing/selftests/drivers/net/Makefile b/tools/testing/selftests/drivers/net/Makefile
index 79c6f998e704..81e0f4a9499e 100644
--- a/tools/testing/selftests/drivers/net/Makefile
+++ b/tools/testing/selftests/drivers/net/Makefile
@@ -30,6 +30,7 @@ TEST_PROGS := \
 	so_txtime.py \
 	stats.py \
 	xdp.py \
+	xsk.py \
 # end of TEST_PROGS
 
 TEST_FILES := \
diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/selftests/drivers/net/config
index 4838adf27fa1..98762922b1ae 100644
--- a/tools/testing/selftests/drivers/net/config
+++ b/tools/testing/selftests/drivers/net/config
@@ -1,6 +1,8 @@
+CONFIG_BPF_SYSCALL=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_DEBUG_INFO_BTF=y
 CONFIG_DEBUG_INFO_BTF_MODULES=n
+CONFIG_HUGETLBFS=y
 CONFIG_INET_PSP=y
 CONFIG_IPV6=y
 CONFIG_MACSEC=m
@@ -22,5 +24,6 @@ CONFIG_NET_SCH_PRIO=m
 CONFIG_PPP=y
 CONFIG_PPPOE=y
 CONFIG_TLS=y
+CONFIG_VETH=y
 CONFIG_VLAN_8021Q=m
 CONFIG_XDP_SOCKETS=y
diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
index c1d58bef754f..8438add502d9 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -125,14 +125,17 @@ class NetDrvEpEnv(NetDrvEnvBase):
     which can be used to send traffic in.
 
     For local testing it creates two network namespaces and a pair
-    of netdevsim devices.
+    of netdevsim devices, or a veth pair with veth_test. The veth_test
+    attribute tells whether the env runs over the veth pair, which it
+    never does with NETIF.
     """
 
     # Network prefixes used for local tests
     sw_v4_pfx = "192.0.2."
     sw_v6_pfx = "2001:db8::"
 
-    def __init__(self, src_path, nsim_test=None, queue_count=None):
+    def __init__(self, src_path, nsim_test=None, queue_count=None,
+                 veth_test=False):
         super().__init__(src_path)
 
         self._stats_settle_time = None
@@ -144,10 +147,15 @@ class NetDrvEpEnv(NetDrvEnvBase):
         self._netns = None
         self._ns = None
         self._ns_peer = None
+        self._veth = None
+        self.veth_test = False
 
         self.addr_v        = { "4": None, "6": None }
         self.remote_addr_v = { "4": None, "6": None }
 
+        if nsim_test and veth_test:
+            raise ValueError("veth_test conflicts with nsim_test=True")
+
         if "NETIF" in self.env:
             if nsim_test is True:
                 raise KsftXfailEx("Test only works on netdevsim")
@@ -162,12 +170,15 @@ class NetDrvEpEnv(NetDrvEnvBase):
             kind = self.env["REMOTE_TYPE"]
             args = self.env["REMOTE_ARGS"]
         else:
-            if nsim_test is False:
+            if veth_test:
+                self.create_local_veth()
+                self.veth_test = True
+                self.dev = ip("-d link show dev " + self._veth, json=True)[0]
+            elif nsim_test is False:
                 raise KsftXfailEx("Test does not work on netdevsim")
-
-            self.create_local()
-
-            self.dev = self._ns.nsims[0].dev
+            else:
+                self.create_local()
+                self.dev = self._ns.nsims[0].dev
 
             self.addr_v["4"] = self.sw_v4_pfx + "1"
             self.addr_v["6"] = self.sw_v6_pfx + "1"
@@ -211,6 +222,18 @@ class NetDrvEpEnv(NetDrvEnvBase):
         self._setup_sw_ifaces(self._ns.nsims[0].ifname,
                               self._ns_peer.nsims[0].ifname)
 
+    def create_local_veth(self):
+        """Create a veth pair, with the peer in a network namespace."""
+        self._netns = NetNS()
+
+        # The peer takes the same name in its own network namespace.
+        veth = "veth" + self._netns.name
+        ip(f"link add {veth} type veth "
+           f"peer name {veth} netns {self._netns.name}")
+        self._veth = veth
+
+        self._setup_sw_ifaces(veth, veth)
+
     def _setup_sw_ifaces(self, ifname, peer_ifname):
         """Address and bring up a local interface and its peer in _netns."""
         ip(f"   addr add dev {ifname} {self.sw_v4_pfx}1/24")
@@ -283,6 +306,9 @@ class NetDrvEpEnv(NetDrvEnvBase):
         if self._ns_peer:
             self._ns_peer.remove()
             self._ns_peer = None
+        if self._veth:
+            ip(f"link del dev {self._veth}")
+            self._veth = None
         if self._netns:
             del self._netns
             self._netns = None
diff --git a/tools/testing/selftests/drivers/net/xsk.py b/tools/testing/selftests/drivers/net/xsk.py
new file mode 100755
index 000000000000..a561a7f9aaf7
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/xsk.py
@@ -0,0 +1,562 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+AF_XDP tests over veth or a NIC.
+
+Each case runs an xskxceiver endpoint on the local interface and one on the
+remote interface. The remote endpoint always runs in SKB mode and does not
+busy poll, so the remote needs no zero-copy support. The endpoints send UDP
+over IPv6, or over IPv4 if NETIF comes without LOCAL_V6 and REMOTE_V6, each
+to the MAC address of its next hop to the other. The local endpoint listens
+on a TCP control port on the local address, and the remote endpoint
+connects to it once the local one listens. The control connection shares
+the tested link, and the XDP programs of both endpoints pass it to the
+stack.
+
+"xskxceiver -l" lists each case with the roles that it tests on hardware,
+e.g. "0: SEND_RECEIVE rx tx", or with none if a NIC run leaves it out.
+test_xsk runs the cases with the local endpoint driven by interrupts, and
+on a NIC, test_xsk_busy_poll runs them again with the local endpoint busy
+polling. The UNALIGNED cases are reported as expected failures without
+being run when either host has no huge pages for them.
+
+Without NETIF, the interfaces are a veth pair with the remote end in a
+network namespace of its own. Each listed case runs in SKB and DRV mode,
+with the local endpoint receiving in that mode. A copy-mode socket sends
+alike in both modes, so the remote endpoint sends as it would in DRV mode.
+The variant name starts with the mode, e.g. test_xsk.drv_SEND_RECEIVE. The
+cases in VETH_XFAIL cannot pass over veth and are reported as expected
+failures without being run. veth does not tie its NAPI instances to its
+queues, so a socket on it has no NAPI to busy poll. Only the initial
+network namespace has the net.core.max_skb_frags sysctl, so the remote
+endpoint takes 17 frags. --max-frags hands the sysctl value to both
+endpoints for TOO_MANY_FRAGS, but the cases in TAILROOM_CASES size the
+UMEM tailroom by the value of each endpoint, and are expected failures
+when the sysctl is not 17.
+
+With NETIF, the local endpoint runs in zero-copy mode on NETIF, the DUT,
+and binds to its last queue, and the remote endpoint binds to queue 0.
+Before the cases run, main() takes the DUT queue out of RSS and adds an
+ntuple filter on each host that steers the test UDP flow to the queue of
+the receiving endpoint, and it undoes that however the run ends. A NIC
+that rebuilds its RSS indirection table on a reset, such as one for an
+XDP, MTU or ring change, puts the queue back into RSS, so a case fails if
+the queue is back in RSS after it. Each case runs once for each role
+listed with it, with the DUT endpoint in that role, and the variant name
+starts with the role, e.g. test_xsk.rx_SEND_RECEIVE. xskxceiver skips the
+multi-buffer cases, such as TOO_MANY_FRAGS, on a DUT without multi-buffer
+zero-copy.
+
+HW_SW_MIN_RING_SIZE and HW_SW_MAX_RING_SIZE expect the TX ring of the
+sending interface, and the latter also the RX ring of the receiving one, at
+given sizes. These cases set them with ethtool -G before the endpoints
+start, and restore them once the endpoints exit or get killed.
+"""
+
+import re
+import shlex
+import sys
+import time
+from contextlib import ExitStack
+from dataclasses import dataclass
+
+from lib.py import (CmdExitFailure, EthtoolFamily, KsftFailEx,
+                    KsftNamedVariant, KsftSkipEx, KsftXfailEx, NetdevFamily,
+                    NetDrvEpEnv, NlError, bkg, cmd, defer, ethtool, ip,
+                    ksft_eq, ksft_exit, ksft_pr, ksft_run, ksft_variants,
+                    rand_port)
+
+# cmd() and bkg() stop waiting for an endpoint that hangs but leave it
+# running, as killing ssh does on the remote, and bkg() waits for the local
+# endpoint to listen without a time limit, so timeout(1) ends each endpoint.
+VETH_CASE_TIMEOUT = 20
+NIC_CASE_TIMEOUT = 120
+SKIP_CODE = 4
+# Traffic and link timeout of the endpoints. veth takes the xskxceiver
+# default, and a NIC can take seconds to bring its link back after an MTU or
+# XDP change.
+VETH_XSK_TIMEOUT = 3
+NIC_XSK_TIMEOUT = 20
+# The TX ring of the sender and the RX ring of the receiver that a case
+# needs at a given size, 64 being the default batch size of xskxceiver.
+RING_SIZES = {
+    "HW_SW_MIN_RING_SIZE": {"tx": 64},
+    "HW_SW_MAX_RING_SIZE": {"tx": "max", "rx": "max"},
+}
+RING_BUSY_TIMEOUT = 5
+NR_HUGEPAGES = 32
+# xskxceiver maps the UMEMs of the UNALIGNED cases with MAP_HUGE_2MB.
+HUGEPAGES = "/sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages"
+MAX_SKB_FRAGS = "/proc/sys/net/core/max_skb_frags"
+# What xskxceiver takes when it cannot read MAX_SKB_FRAGS.
+DEFAULT_SKB_FRAGS = 17
+# The ip link option that detaches the XDP program of an endpoint mode.
+XDP_OFF = {"skb": "xdpgeneric off", "drv": "xdpdrv off", "zc": "xdpdrv off"}
+# Why a case cannot pass over veth, by the mode, None for any, and the name.
+VETH_XFAIL = {
+    # Generic XDP leaves no room to grow the tail, so the RX endpoint skips.
+    ("skb", "XDP_ADJUST_TAIL_GROW"): "generic XDP has no tailroom",
+    ("skb", "XDP_ADJUST_TAIL_GROW_MULTI_BUFF"): "generic XDP has no tailroom",
+    # veth copies each frame into a page_pool fragment that leaves no room
+    # to grow the small frames of the case unless it is the last one of its
+    # page, so the XDP program drops most frames.
+    ("drv", "XDP_ADJUST_TAIL_GROW"): "veth frames have no tailroom",
+    # veth registers its XDP RX queues without a frag size, so
+    # bpf_xdp_adjust_tail() cannot grow a frag and the RX endpoint skips.
+    ("drv", "XDP_ADJUST_TAIL_GROW_MULTI_BUFF"): "veth cannot grow frags",
+    # bpf_xdp_adjust_tail() frees a frag that it trims off as the memory type
+    # of the XDP RX queue, which veth and generic XDP leave at
+    # MEM_TYPE_PAGE_SHARED for frames they copy into page_pool pages, so
+    # page_frag_free() frees a page that its pool still owns. The endpoints
+    # pass regardless, so running the case would only harm the kernel.
+    (None, "XDP_ADJUST_TAIL_SHRINK_MULTI_BUFF"): "trimmed frags leak",
+    (None, "HW_SW_MIN_RING_SIZE"): "veth has no HW rings",
+    (None, "HW_SW_MAX_RING_SIZE"): "veth has no HW rings",
+}
+# Cases not in VETH_XFAIL that size the UMEM tailroom by
+# net.core.max_skb_frags.
+TAILROOM_CASES = ("STAT_RX_DROPPED",)
+
+
+@dataclass
+class Case:
+    """The mode and direction of the local endpoint in a case, which
+    xskxceiver -t takes as test_id."""
+    mode: str
+    direction: str
+    test_id: int
+    name: str
+
+
+def _get_cases(cfg):
+    """
+    Each test case from xskxceiver -l comes out in a form below, with the
+    roles that it tests on hardware, if any:
+    0: SEND_RECEIVE rx tx
+    9: POLL_RX rx
+    33: BIDIRECTIONAL
+    """
+    ret = []
+    out = cmd([str(cfg.bin_local), "-l"]).stdout
+    cases = re.findall(r"^(\d+): (\w+)((?: rx| tx)*)$", out, re.MULTILINE)
+    if cfg.veth_test:
+        for mode in ("skb", "drv"):
+            for test_id, name, _ in cases:
+                case = Case(mode, "rx", int(test_id), name)
+                ret.append(KsftNamedVariant(f"{mode}_{name}", case))
+        return ret
+
+    for test_id, name, roles in cases:
+        for direction in roles.split():
+            case = Case("zc", direction, int(test_id), name)
+            ret.append(KsftNamedVariant(f"{direction}_{name}", case))
+    return ret
+
+
+def _reserve_hugepages(saved, host=None):
+    """Raise the count of 2 MiB huge pages on host to what the UNALIGNED
+    cases need, and return whether it has that many. Add the count to
+    restore to saved, a list for _release_hugepages(), or restore it right
+    away if the host falls short. A host without the pool or the rights to
+    resize it has no huge pages for the cases."""
+    have = cmd(f"cat {HUGEPAGES}", fail=False, host=host)
+    if have.ret:
+        return False
+    have = int(have.stdout)
+    if have >= NR_HUGEPAGES:
+        return True
+    saved.append((host, have))
+    cmd(f"echo {NR_HUGEPAGES} > {HUGEPAGES}", shell=True, fail=False,
+        host=host)
+    if int(cmd(f"cat {HUGEPAGES}", host=host).stdout) >= NR_HUGEPAGES:
+        return True
+    _release_hugepages([saved.pop()])
+    return False
+
+
+def _release_hugepages(saved):
+    """Restore the counts that _reserve_hugepages() added to saved, the last
+    one first, as two hosts can share the pool."""
+    for host, have in reversed(saved):
+        cmd(f"echo {have} > {HUGEPAGES}", shell=True, fail=False, host=host)
+
+
+def _setup_busy_poll(ifname):
+    """Set napi_defer_hard_irqs and gro_flush_timeout of ifname until the
+    case ends, so that SO_PREFER_BUSY_POLL of xskxceiver -b keeps the IRQs
+    masked."""
+    for attr, val in (("napi_defer_hard_irqs", 2),
+                      ("gro_flush_timeout", 200000)):
+        path = f"/sys/class/net/{ifname}/{attr}"
+        old = cmd(f"cat {path}").stdout.strip()
+        if old == str(val):
+            continue
+        cmd(f"echo {val} > {path}", shell=True)
+        defer(cmd, f"echo {old} > {path}", shell=True)
+
+
+def _restore_rss(cfg, indir):
+    """Restore the RSS indirection table of the DUT. Reset it to the default
+    first, which leaves it to the driver again, and write indir back only if
+    it was not the default."""
+    ethtool(f"-X {cfg.ifname} default")
+    req = {"header": {"dev-index": cfg.ifindex}}
+    if cfg.ethnl.rss_get(req).get("indir") != indir:
+        cfg.ethnl.rss_set({**req, "indir": indir})
+
+
+def _reserve_queue(cfg, undo):
+    """Take the last queue with both an RX and a TX ring out of RSS until
+    undo, return None if the DUT cannot. A TX endpoint fills no RX buffers,
+    so in zero-copy mode its queue drops what it receives, the control
+    connection included."""
+    req = {"header": {"dev-index": cfg.ifindex}}
+    try:
+        ch = cfg.ethnl.channels_get(req)
+        rss = cfg.ethnl.rss_get(req)
+    except NlError:
+        print(f"1..0 # SKIP cannot get the channels or RSS of {cfg.ifname}")
+        return None
+    count = ch.get("combined-count", 0) + min(ch.get("rx-count", 0),
+                                              ch.get("tx-count", 0))
+    if count < 2:
+        print("1..0 # SKIP Test requires NETIF with at least 2 channels")
+        return None
+    queue = count - 1
+    if cmd(f"ethtool -X {cfg.ifname} equal {queue}", fail=False).ret:
+        print(f"1..0 # SKIP {cfg.ifname} cannot take queue {queue} out of RSS")
+        return None
+    undo.callback(_restore_rss, cfg, rss.get("indir"))
+    return queue
+
+
+def _check_rss(cfg):
+    """Fail the case if the DUT queue is back in RSS, as on a driver that
+    rebuilds its indirection table on a reset, and take it out again for
+    the next case."""
+    req = {"header": {"dev-index": cfg.ifindex}}
+    if cfg.queue not in cfg.ethnl.rss_get(req).get("indir", []):
+        return
+    cmd(f"ethtool -X {cfg.ifname} equal {cfg.queue}", fail=False)
+    raise KsftFailEx(f"queue {cfg.queue} of {cfg.ifname} is back in RSS")
+
+
+def _ntuple_on(undo, ifname, host=None):
+    """Turn on ntuple-filters of ifname until undo, return False if it
+    cannot."""
+    ntuple = ethtool(f"-k {ifname}", json=True, host=host)[0]["ntuple-filters"]
+    if ntuple["active"]:
+        return True
+    if ntuple["fixed"]:
+        print(f"1..0 # SKIP {ifname} does not support ntuple-filters")
+        return False
+    ethtool(f"-K {ifname} ntuple-filters on", host=host)
+    undo.callback(ethtool, f"-K {ifname} ntuple-filters off", host=host)
+    return True
+
+
+def _steer_udp(cfg, undo, ifname, queue, host=None):
+    """Steer the test flow to queue until undo, return False if ifname
+    rejects the ntuple rule."""
+    res = cmd(f"ethtool -N {ifname} flow-type udp{cfg.addr_ipver} "
+              f"dst-port {cfg.udp_port} action {queue}", host=host, fail=False)
+    if res.ret:
+        print(f"1..0 # SKIP {ifname} rejects the ntuple rule")
+        return False
+    rule = re.search(r"ID (\d+)", res.stdout).group(1)
+    undo.callback(ethtool, f"-N {ifname} delete {rule}", host=host)
+    return True
+
+
+def _next_hop_mac(cfg, addr, peer_mac, ifname, host=None):
+    """Return the MAC address that host sends packets for addr to: peer_mac
+    if addr is on link, else the MAC address of the gateway."""
+    route = ip(f"-{cfg.addr_ipver} route get {addr}", json=True,
+               host=host)[0]
+    gw = route.get("gateway")
+    if not gw:
+        return peer_mac
+
+    # Resolve the gateway, from ifname as an IPv6 one is likely link-local.
+    # The ping only triggers ARP or neighbour discovery, so the gateway
+    # may ignore it.
+    cmd(f"ping -c1 -W1 -I{ifname} {gw}", host=host, fail=False)
+    # Unlike "neigh get", "neigh show" has JSON output in older iproute2.
+    neigh = ip(f"neigh show {gw} dev {ifname}", json=True, host=host)
+    if not neigh or "lladdr" not in neigh[0]:
+        raise KsftFailEx(f"cannot resolve the MAC address of gateway {gw}")
+    return neigh[0]["lladdr"]
+
+
+def _set_ring(ifname, ring, size, host=None):
+    """Set a ring of ifname with ethtool -G. A driver can refuse that while
+    an XSK socket that just closed still holds a queue, as ice does until a
+    work item releases the buffer pool of the socket, so retry for a while."""
+    deadline = time.monotonic() + RING_BUSY_TIMEOUT
+    while True:
+        res = cmd(f"ethtool -G {ifname} {ring} {size}", host=host, fail=False)
+        if res.ret == 0:
+            return
+        if "Device or resource busy" not in res.stderr or \
+           time.monotonic() > deadline:
+            raise CmdExitFailure("Command failed", res)
+        time.sleep(0.1)
+
+
+def _size_rings(cfg, name, direction):
+    """Set the rings that case name needs, and restore them after it."""
+    for ring, size in RING_SIZES[name].items():
+        # The DUT endpoint sends for tx, and receives for rx.
+        if ring == direction:
+            host, ifname = None, cfg.ifname
+        else:
+            host, ifname = cfg.remote, cfg.remote_ifname
+        try:
+            cur = ethtool(f"-g {ifname}", json=True, host=host)[0]
+        except CmdExitFailure:
+            cur = {}
+        if ring not in cur:
+            raise KsftSkipEx(f"cannot read the {ring} ring size of {ifname}")
+        if size == "max":
+            size = cur[f"{ring}-max"]
+        if cur[ring] == size:
+            continue
+        _set_ring(ifname, ring, size, host)
+        defer(_set_ring, ifname, ring, cur[ring], host)
+
+
+def _veth_xfail(cfg, case):
+    """Report a case that cannot pass over veth as an expected failure
+    without running it."""
+    reason = VETH_XFAIL.get((case.mode, case.name),
+                            VETH_XFAIL.get((None, case.name)))
+    if not reason and case.name in TAILROOM_CASES and \
+       cfg.max_skb_frags != DEFAULT_SKB_FRAGS:
+        reason = (f"the remote endpoint takes max_skb_frags as "
+                  f"{DEFAULT_SKB_FRAGS}, not {cfg.max_skb_frags}")
+    if reason:
+        raise KsftXfailEx(reason)
+
+
+def _setup(cfg, case, busy_poll):
+    # A case that fails to clean up can leave an XDP program behind, which
+    # cfg.dev and cfg.remote_dev, taken before the first case, do not show.
+    for ifname, host in ((cfg.ifname, None), (cfg.remote_ifname, cfg.remote)):
+        if "xdp" in ip(f"link show dev {ifname}", json=True, host=host)[0]:
+            raise KsftSkipEx(f"{ifname} already has an XDP program")
+    if not cfg.veth_test:
+        # Defers run in reverse, so this runs once the case has cleaned up,
+        # which can reset the NIC as well.
+        defer(_check_rss, cfg)
+    if busy_poll:
+        _setup_busy_poll(cfg.ifname)
+    if "RING_SIZE" in case.name:
+        _size_rings(cfg, case.name, case.direction)
+
+    # Defers run in reverse, so the XDP programs, which can cap the MTU, go
+    # first.
+    fallbacks = [
+        defer(ip, f"link set dev {cfg.ifname} mtu {cfg.dev['mtu']}"),
+        defer(ip, f"link set dev {cfg.remote_ifname} "
+                  f"mtu {cfg.remote_dev['mtu']}", host=cfg.remote),
+        defer(ip, f"link set dev {cfg.ifname} {XDP_OFF[case.mode]}"),
+        defer(ip, f"link set dev {cfg.remote_ifname} {XDP_OFF['skb']}",
+              host=cfg.remote),
+    ]
+    return fallbacks
+
+
+def _check_opt(opt, val, low, high):
+    """xskxceiver takes its numeric options as given, so check that val, the
+    value of opt, is in low-high before it is passed on."""
+    if not low <= val <= high:
+        raise ValueError(f"xskxceiver {opt} {val} is not in {low}-{high}")
+
+
+def _fixup_args(cfg, test_id, ctrl_port):
+    cfg.args[cfg.args.index("-t") + 1] = str(test_id)
+    cfg.args[cfg.args.index("-P") + 1] = str(ctrl_port)
+
+
+def _run(cfg, local_args, remote_args):
+    """Start the local endpoint, and the remote one once the local one
+    listens. Log the output of an endpoint that does not pass, and return
+    their exit codes."""
+    # Wait for each endpoint until timeout(1) has ended it, not just the 20 s
+    # that bkg() waits for the local one to exit.
+    wait = cfg.case_timeout + 10
+    with bkg(local_args, ksft_ready=True, exit_wait=True, fail=False) as local:
+        remote = cmd(shlex.join(remote_args), host=cfg.remote, fail=False,
+                     timeout=wait)
+        local.process(terminate=False, fail=False, timeout=wait)
+    for endpoint in (local, remote):
+        if endpoint.ret:
+            ksft_pr(endpoint)
+    return local.ret, remote.ret
+
+
+def _test(cfg, case, busy_poll):
+    if "UNALIGNED" in case.name and not cfg.hugepages:
+        raise KsftXfailEx("no huge pages")
+    if cfg.veth_test:
+        _veth_xfail(cfg, case)
+
+    ctrl_port = rand_port()
+    _check_opt("-P", ctrl_port, 1, 0xffff)
+
+    fallbacks = _setup(cfg, case, busy_poll)
+    _fixup_args(cfg, case.test_id, ctrl_port)
+
+    remote = [*cfg.remote_args,
+              "-e", "tx" if case.direction == "rx" else "rx",
+              *cfg.args]
+    local = [*cfg.local_args,
+             "-m", case.mode,
+             "-e", case.direction,
+             *(["-b"] if busy_poll else []),
+             *cfg.args]
+
+    local_ret, remote_ret = _run(cfg, local, remote)
+    rets = {local_ret, remote_ret}
+    if rets <= {0, SKIP_CODE}:
+        # Both endpoints detached their XDP programs and restored the MTU.
+        for fallback in fallbacks:
+            fallback.cancel()
+    # An endpoint that skips the case tells its peer, which skips it too.
+    if SKIP_CODE in rets and rets <= {0, SKIP_CODE}:
+        raise KsftSkipEx("xskxceiver skipped the case")
+    ksft_eq(local_ret, 0, "local endpoint exit code")
+    ksft_eq(remote_ret, 0, "remote endpoint exit code")
+
+
+def test_xsk(cfg, case):
+    """Run a case with the endpoints driven by interrupts."""
+    _test(cfg, case, busy_poll=False)
+
+
+def test_xsk_busy_poll(cfg, case):
+    """Run a case with the local endpoint busy polling."""
+    _test(cfg, case, busy_poll=True)
+
+
+def _setup_veth(cfg):
+    """Set up a run over veth, where both endpoints bind queue 0."""
+    cfg.queue = 0
+    cfg.case_timeout = VETH_CASE_TIMEOUT
+    cfg.xsk_timeout = VETH_XSK_TIMEOUT
+    try:
+        with open(MAX_SKB_FRAGS, encoding="utf-8") as fp:
+            cfg.max_skb_frags = int(fp.read())
+    except OSError:
+        cfg.max_skb_frags = DEFAULT_SKB_FRAGS
+    # An skb takes a descriptor for its linear part and one per frag.
+    cfg.max_frags = cfg.max_skb_frags + 1
+
+
+def _setup_nic(cfg, undo):
+    """Set up a run on NETIF until undo, return False if the DUT cannot run
+    the cases."""
+    cfg.case_timeout = NIC_CASE_TIMEOUT
+    cfg.xsk_timeout = NIC_XSK_TIMEOUT
+    cfg.ethnl = EthtoolFamily()
+    cfg.netnl = NetdevFamily()
+
+    dev = cfg.netnl.dev_get({"ifindex": cfg.ifindex})
+    if "xsk-zerocopy" not in dev["xdp-features"]:
+        print("1..0 # SKIP NIC does not advertise AF_XDP zero-copy")
+        return False
+
+    cfg.max_frags = dev.get("xdp-zc-max-segs", 1)
+
+    # Before the DUT queue is taken out of RSS, as turning ntuple-filters on
+    # can reset a NIC, and with it the RSS indirection table.
+    if not (_ntuple_on(undo, cfg.ifname) and
+            _ntuple_on(undo, cfg.remote_ifname, cfg.remote)):
+        return False
+
+    cfg.queue = _reserve_queue(cfg, undo)
+    if cfg.queue is None:
+        return False
+
+    return (_steer_udp(cfg, undo, cfg.ifname, cfg.queue) and
+            _steer_udp(cfg, undo, cfg.remote_ifname, 0, cfg.remote))
+
+
+def _set_args(cfg, local_dmac, remote_dmac):
+    """Set the endpoint options that the cases share. _fixup_args() sets
+    those that differ between them."""
+    _check_opt("--max-frags", cfg.max_frags, 1, 0xffff)
+    _check_opt("--udp-port", cfg.udp_port, 1, 0xffff)
+    _check_opt("--timeout", cfg.xsk_timeout, 1, 0xffff)
+    _check_opt("--queue", cfg.queue, 0, 0xffffffff)
+
+    cfg.args = ["-p", cfg.addr,
+                "--max-frags", str(cfg.max_frags),
+                "--udp-port", str(cfg.udp_port),
+                "--timeout", str(cfg.xsk_timeout),
+                "-t", "0",
+                "-P", "0"]
+    cfg.remote_args = ["timeout", "-k", "5", str(cfg.case_timeout),
+                       str(cfg.bin_remote),
+                       "-i", cfg.remote_ifname,
+                       "-m", "skb",
+                       "--queue", "0",
+                       "--src-ip", cfg.remote_addr,
+                       "--dst-ip", cfg.addr,
+                       "--dst-mac", remote_dmac]
+    cfg.local_args = ["timeout", "-k", "5", str(cfg.case_timeout),
+                      str(cfg.bin_local),
+                      "-i", cfg.ifname,
+                      "--listen",
+                      "--queue", str(cfg.queue),
+                      "--src-ip", cfg.addr,
+                      "--dst-ip", cfg.remote_addr,
+                      "--dst-mac", local_dmac]
+
+
+def main():
+    """Run the cases over veth without NETIF, else on NETIF."""
+    # defer() works only within a case, so undo restores what main() sets up
+    # for all of them, however the run ends.
+    with NetDrvEpEnv(__file__, veth_test=True) as cfg, \
+         ExitStack() as undo:
+        cfg.bin_local = cfg.net_lib_dir / "xskxceiver"
+        if not cfg.bin_local.exists():
+            print(f"1..0 # SKIP {cfg.bin_local} was not built")
+            sys.exit(SKIP_CODE)
+
+        # Before _setup_nic(), as ntuple-filters can reset a NIC.
+        local_dmac = _next_hop_mac(cfg, cfg.remote_addr,
+                                   cfg.remote_dev["address"], cfg.ifname)
+        remote_dmac = _next_hop_mac(cfg, cfg.addr, cfg.dev["address"],
+                                    cfg.remote_ifname, cfg.remote)
+
+        cfg.udp_port = rand_port()
+        if cfg.veth_test:
+            _setup_veth(cfg)
+        elif not _setup_nic(cfg, undo):
+            sys.exit(SKIP_CODE)
+
+        cfg.bin_remote = cfg.remote.deploy(cfg.bin_local)
+
+        saved_hugepages = []
+        undo.callback(_release_hugepages, saved_hugepages)
+        cfg.hugepages = (_reserve_hugepages(saved_hugepages) and
+                         _reserve_hugepages(saved_hugepages, cfg.remote))
+        if not cfg.hugepages:
+            _release_hugepages(saved_hugepages)
+            saved_hugepages.clear()
+
+        cases = _get_cases(cfg)
+        _set_args(cfg, local_dmac, remote_dmac)
+
+        tests = [ksft_variants(cases)(test_xsk)]
+        if not cfg.veth_test:
+            tests.append(ksft_variants(cases)(test_xsk_busy_poll))
+        ksft_run(tests, args=(cfg,))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
index fa6d8798e6b0..3eb313eb48ea 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
@@ -55,6 +55,9 @@
  *    l. If multi-buffer is supported, try various nasty combinations of descriptors to
  *       check if they pass the validation or not
  *
+ * On a physical device, drivers/net/xsk.py runs the hardware cases in
+ * zero-copy mode, with an SKB-mode peer on a remote host.
+ *
  * Flow:
  * -----
  * - drivers/net/xsk.py starts two processes: Tx and Rx
-- 
2.43.0

