Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791987;
	b=UAw9pnW3u4OVX+eNF9b2IVQdzX9jWmUG/iXkDsTUvovDOOrvILb9QC9NFCj+GF56DKEp
	 7Nn6BSXBI+8Wh0YoZ9i5SmUJOZp2ahijsWThenpFiicKEpYfyf5ERisiVtcWJb7qM0Crx
	 hYtrvx9d2ilY1W6/XNT9xn4oi7CbasmCkc/nFRfyfuvfIeimWWNUy/ktB0FxQPcoa/qEw
	 X0LS+JCJApZgtIolwK1B3qBGMepsEasjGXpYW6arojEQtyT+PCGrfqb6+jKPPDMx34HTJ
	 wnZLCRgOabOijmLEeIoTw9WoC/O5eFlCSdgd6QoZK812cwKoZ+N28Ri1wIlOQLUesYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791987;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KJeTZxTz1DEhFENx3s64+kbwGEm/r0ctkCW3q2iH8yM=;
	b=nqj1PQ6+nyQ1M9ygo4mtdb5+BJYh8ga7CAuynwa5q01rq7mP6cvA2HbVXzOcg1tk5tQv
	 1DBxXzCAVMgDC9qRahEQf7BMq7QN1j35nXDzNcUmfrMexIr+nRdP1q4Xz34NbgqpspDEq
	 HzQkuCY4OUGuCw91m5fyeaPqDoDvRjcpXqZl8q65o3m8TrKrNsUzQj2XYvIVrHMeBhSWR
	 2e/lRvplqZscbRy6XU5+gRhqZJNHxSf+vthjQNdf+w6+EjDP0garahc+PZ2Ro46Tpd9Oj
	 rLbNUXFOhdWLe+ROuEx8BU45bv7TKT3DD/IVCuGejvT5vsINjVoLgcIt0jLw6hPuIHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SEI+gQv+;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B42606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B42606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SEI+gQv+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791986; x=1827327986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u7ig0P2AiAr/QvNrXupyKQOpJQykCe+O3B5WlJxQnYw=;
  b=SEI+gQv+HLjBFBBLWCpLZetwblDM4G0WCD+NjuPqpOApYFCQEUkGLKPO
   0sEI/LQiTrCrYG+nuUNW4LNCQHGzNyIIn2O9KNNMzgyyF+9ucKgyfWJm1
   SlcmnIqE2vUQKEf+C0tXmMlkdtLz/mG7Kavd06gsJqOSUWW9L8U5A9hvx
   Yl86ds2tHZjF7N24gofVwjtxBIq9LhJHmOLXXDJnZ+HHgHRHe6jOJ7Sw7
   Nupwb/v9pW0FRFf13Nes2zFXTBL1iSg+E3z8QEVDD6H6rFlhX0RRdPHL+
   g3EqvE5ypSpW/qxAXCoKAONIxDylG0OHOY+mFZkJ9Ggzi0du9Un2v5umc
   w==;
X-CSE-ConnectionGUID: WPaCZXw8TT2AyjantGFidA==
X-CSE-MsgGUID: BdcDqLWqQbyhgKkFR8Z0Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4666249"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4666249"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:06:25 -0800
X-CSE-ConnectionGUID: 3qP8+ZAkTwmjPER3kkmXkw==
X-CSE-MsgGUID: w3kw+Yg0RuSilB3NOjIz5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12203003"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:06:23 -0800
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
Subject: [PATCH v6 net-next 15/15] selftests: drv-net: run the AF_XDP tests over veth or a NIC
Date: Fri, 27 Nov 2026 16:05:27 +0100
Message-Id: <20261127150527.1122049-16-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
References: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
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
xskxceiver processes: a local one, and a remote one in SKB mode, so that
the remote needs no zero-copy support. Each case skips if either
interface has an XDP program, sets up what it needs, undoes it with
defer(), and detaches XDP and restores the MTU on both sides after the
endpoints exit, as a killed endpoint cannot.

Without NETIF, the endpoints run over a veth pair, the remote end in a
namespace, and each case runs with the local endpoint in SKB and DRV
mode, as test_xsk.sh did. For this, NetDrvEpEnv takes sw_drv,
"netdevsim" by default, to ask for a veth pair instead. Cases that veth
cannot pass are expected failures.

With NETIF, the local endpoint runs in zero-copy mode, once per role
that xskxceiver -l lists for the case. Each case takes the DUT queue
out of RSS, as a zero-copy TX queue drops what it receives, and steers
the test flow to the bound queues and the control connection to DUT
queue 0 with ntuple rules, over IPv4 if a host rejects IPv6 ones. A DUT
without zero-copy or a second queue skips.

Every case also runs with the local endpoint busy polling, which veth
supports since commit c6d21717a602 ("veth: link RX queues to their NAPI
instances"). Over veth, that endpoint only receives, so unlike
test_xsk.sh, the run does not busy poll a TX socket. The UNALIGNED
cases are expected failures without huge pages on both hosts.

Also fix hugepages_present(), which since commit 041b68f688a3
("selftests/xsx: test for huge pages only once") has passed
MAP_HUGE_2MB to mmap() as the offset rather than as a flag.

List xsk.py in TEST_PROGS, as a SW run passes.

Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/drivers/net/Makefile  |   1 +
 tools/testing/selftests/drivers/net/config    |   3 +
 .../selftests/drivers/net/lib/py/env.py       |  44 +-
 tools/testing/selftests/drivers/net/xsk.py    | 453 ++++++++++++++++++
 tools/testing/selftests/net/lib/Makefile      |   2 +-
 .../testing/selftests/net/lib/xsk/test_xsk.c  |   3 +-
 .../selftests/net/lib/xsk/xskxceiver.c        |  37 +-
 8 files changed, 516 insertions(+), 28 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/xsk.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b7d54034856..a143009f8cc8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30608,6 +30608,7 @@ F:	include/net/xsk_buff_pool.h
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
index ab404f81521f..e089f4e79cd5 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -125,16 +125,21 @@ class NetDrvEpEnv(NetDrvEnvBase):
     which can be used to send traffic in.
 
     For local testing it creates two network namespaces and a pair
-    of netdevsim devices.
+    of sw_drv devices, netdevsim by default or veth. The sw_drv
+    attribute holds the driver of that pair, and is None with NETIF.
     """
 
     # Network prefixes used for local tests
     sw_v4_pfx = "192.0.2."
     sw_v6_pfx = "2001:db8::"
 
-    def __init__(self, src_path, sw_test=None, queue_count=None):
+    def __init__(self, src_path, sw_test=None, queue_count=None,
+                 sw_drv="netdevsim"):
         super().__init__(src_path)
 
+        if sw_drv not in ("netdevsim", "veth"):
+            raise ValueError(f"Unsupported sw_drv: {sw_drv}")
+
         self._stats_settle_time = None
         self._queue_count = queue_count
 
@@ -144,13 +149,15 @@ class NetDrvEpEnv(NetDrvEnvBase):
         self._netns = None
         self._ns = None
         self._ns_peer = None
+        self._veth = None
+        self.sw_drv = None
 
         self.addr_v        = { "4": None, "6": None }
         self.remote_addr_v = { "4": None, "6": None }
 
         if "NETIF" in self.env:
             if sw_test is True:
-                raise KsftXfailEx("Test only works on netdevsim")
+                raise KsftXfailEx(f"Test only works on {sw_drv}")
             self._check_env()
 
             self.dev = ip("-d link show dev " + self.env['NETIF'], json=True)[0]
@@ -163,11 +170,15 @@ class NetDrvEpEnv(NetDrvEnvBase):
             args = self.env["REMOTE_ARGS"]
         else:
             if sw_test is False:
-                raise KsftXfailEx("Test does not work on netdevsim")
+                raise KsftXfailEx(f"Test does not work on {sw_drv}")
 
-            self.create_local()
-
-            self.dev = self._ns.nsims[0].dev
+            self.sw_drv = sw_drv
+            if sw_drv == "veth":
+                self.create_local_veth()
+                self.dev = ip("-d link show dev " + self._veth, json=True)[0]
+            else:
+                self.create_local()
+                self.dev = self._ns.nsims[0].dev
 
             self.addr_v["4"] = self.sw_v4_pfx + "1"
             self.addr_v["6"] = self.sw_v6_pfx + "1"
@@ -211,6 +222,22 @@ class NetDrvEpEnv(NetDrvEnvBase):
         self._setup_sw_ifaces(self._ns.nsims[0].ifname,
                               self._ns_peer.nsims[0].ifname)
 
+    def create_local_veth(self):
+        """Create a veth pair, with the peer in a network namespace."""
+        self._netns = NetNS()
+
+        queues = ""
+        if self._queue_count:
+            queues = (f" numtxqueues {self._queue_count}"
+                      f" numrxqueues {self._queue_count}")
+        # The peer takes the same name in its own network namespace.
+        veth = "veth" + self._netns.name
+        ip(f"link add {veth}{queues} type veth "
+           f"peer name {veth}{queues} netns {self._netns.name}")
+        self._veth = veth
+
+        self._setup_sw_ifaces(veth, veth)
+
     def _setup_sw_ifaces(self, ifname, peer_ifname):
         """Address and bring up a local interface and its peer in _netns."""
         ip(f"   addr add dev {ifname} {self.sw_v4_pfx}1/24")
@@ -283,6 +310,9 @@ class NetDrvEpEnv(NetDrvEnvBase):
         if self._ns_peer:
             self._ns_peer.remove()
             self._ns_peer = None
+        if self._veth:
+            cmd(f"ip link del dev {self._veth}", fail=False)
+            self._veth = None
         if self._netns:
             del self._netns
             self._netns = None
diff --git a/tools/testing/selftests/drivers/net/xsk.py b/tools/testing/selftests/drivers/net/xsk.py
new file mode 100755
index 000000000000..ebde81fa5140
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/xsk.py
@@ -0,0 +1,453 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+AF_XDP tests over veth or a NIC.
+
+Each case runs two xskxceiver processes, an endpoint on the local interface
+and one on the remote interface. They build the frames that they send each
+other themselves, and send them to the MAC address of their next hop to the
+other. The remote endpoint always runs in SKB mode and does not busy poll,
+so the remote needs no zero-copy support. The local endpoint listens on a
+TCP control port, which the remote endpoint connects to over the tested
+link, and the XDP programs of both pass all but the test flow to the stack.
+"xskxceiver -l" lists the cases, each with the roles that it tests on a NIC,
+if any. test_xsk_busy_poll runs each case again with the local endpoint
+busy polling.
+
+Without NETIF, the interfaces are a veth pair with the remote end in a
+network namespace of its own. Each case runs with the local endpoint
+receiving in SKB and in DRV mode, e.g. test_xsk.drv_SEND_RECEIVE. The cases
+in VETH_XFAIL cannot pass over veth and are expected failures without being
+run. Only the initial network namespace has the net.core.max_skb_frags
+sysctl, so the remote endpoint assumes the default of 17. The cases in
+TAILROOM_CASES size the UMEM tailroom of each endpoint by its own value, so
+they are expected failures if the sysctl is not 17.
+
+With NETIF, the local endpoint runs in zero-copy mode once in each role that
+a case lists, e.g. test_xsk.rx_SEND_RECEIVE. It binds to the last queue of
+NETIF, which each case takes out of RSS, as a TX endpoint in zero-copy mode
+fills no RX buffers, so its queue drops what it receives. ntuple rules steer
+the test flow to the queue of the receiving endpoint, and the control
+connection away from the queue of the local one. If either host rejects
+them for IPv6, the case runs over IPv4. NETIF thus needs RSS, and both hosts
+ntuple filters. The cases in RING_SIZES set the rings that they test with
+ethtool -G.
+
+The UNALIGNED cases need 32 huge pages of 2 MiB on both hosts, and are
+expected failures without them.
+"""
+
+import re
+import shlex
+import socket
+import time
+from dataclasses import dataclass
+
+from lib.py import (CmdExitFailure, EthtoolFamily, KsftFailEx,
+                    KsftNamedVariant, KsftSkipEx, KsftXfailEx, NetdevFamily,
+                    NetDrvEpEnv, NlError, bkg, cmd, ctl_file_write, defer,
+                    ethtool, ip, ksft_disruptive, ksft_eq, ksft_exit, ksft_pr,
+                    ksft_run, ksft_variants, rand_port, set_ethtool_feat)
+
+# cmd() and bkg() stop waiting for an endpoint that hangs but leave it
+# running, as killing ssh does on the remote, and bkg() waits for the local
+# endpoint to listen without a time limit, so timeout(1) ends each endpoint.
+VETH_CASE_TIMEOUT = 20
+NIC_CASE_TIMEOUT = 120
+SKIP_CODE = 4
+# Traffic and link timeout of the endpoints. veth takes the xskxceiver
+# default, and a NIC can take seconds to bring its link back after an MTU,
+# XDP or ntuple-filters change.
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
+    if cfg.sw_drv:
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
+def _reserve_hugepages(host=None):
+    """Raise the count of 2 MiB huge pages on host to what the UNALIGNED
+    cases need until the case ends. A host without the pool or the rights
+    to resize it has no huge pages for them."""
+    try:
+        have = int(cmd(f"cat {HUGEPAGES}", host=host).stdout)
+        if have >= NR_HUGEPAGES:
+            return
+        if host:
+            # ctl_file_write() only writes local files.
+            cmd(f"echo {NR_HUGEPAGES} > {HUGEPAGES}", shell=True, host=host)
+            defer(cmd, f"echo {have} > {HUGEPAGES}", shell=True, host=host)
+        else:
+            ctl_file_write(HUGEPAGES, NR_HUGEPAGES)
+        have = int(cmd(f"cat {HUGEPAGES}", host=host).stdout)
+    except (CmdExitFailure, OSError) as e:
+        raise KsftXfailEx("no huge pages") from e
+    if have < NR_HUGEPAGES:
+        raise KsftXfailEx("no huge pages")
+
+
+def _setup_veth(case):
+    """Return the frags per packet of the endpoints over veth, or report a
+    case that cannot pass over veth as an expected failure without running
+    it."""
+    try:
+        with open(MAX_SKB_FRAGS, encoding="utf-8") as fp:
+            max_skb_frags = int(fp.read())
+    except OSError:
+        max_skb_frags = DEFAULT_SKB_FRAGS
+
+    reason = VETH_XFAIL.get((case.mode, case.name),
+                            VETH_XFAIL.get((None, case.name)))
+    if not reason and case.name in TAILROOM_CASES and \
+       max_skb_frags != DEFAULT_SKB_FRAGS:
+        reason = (f"the remote endpoint takes max_skb_frags as "
+                  f"{DEFAULT_SKB_FRAGS}, not {max_skb_frags}")
+    if reason:
+        raise KsftXfailEx(reason)
+    # An skb takes a descriptor for its linear part and one per frag.
+    return max_skb_frags + 1
+
+
+def _restore_rss(cfg, indir):
+    """Restore the RSS indirection table of the DUT. Reset it first, which
+    leaves it to the driver again, and write indir back only if it was not
+    the default."""
+    req = {"header": {"dev-index": cfg.ifindex}}
+    cfg.ethnl.rss_set({**req, "indir": []})
+    if cfg.ethnl.rss_get(req).get("indir") != indir:
+        cfg.ethnl.rss_set({**req, "indir": indir})
+
+
+def _add_rule(ifname, rule, host=None):
+    """Add an ntuple rule to ifname until the case ends. Return the defer()
+    that deletes it, or None if ifname rejects the rule."""
+    try:
+        res = ethtool(f"-N {ifname} {rule}", host=host)
+    except CmdExitFailure:
+        return None
+    rule_id = re.search(r"ID (\d+)", res.stdout).group(1)
+    return defer(ethtool, f"-N {ifname} delete {rule_id}", host=host)
+
+
+def _steer(cfg, queue, udp_port, ctrl_port):
+    """Steer the test flow to the queue of the receiving endpoint on each
+    host, and the control connection to queue 0 of the DUT, until the case
+    ends. The TCP rule also turns off i40e ATR, which would steer the control
+    connection to the queue that it sends on. Fall back to IPv4 if either
+    host rejects the rules for IPv6, as ixgbe does."""
+    for ipver in ("6", "4"):
+        if not (cfg.addr_v[ipver] and cfg.remote_addr_v[ipver]):
+            continue
+        rules = []
+        for ifname, host, flow, port, action in (
+                (cfg.ifname, None, "udp", udp_port, queue),
+                (cfg.remote_ifname, cfg.remote, "udp", udp_port, 0),
+                (cfg.ifname, None, "tcp", ctrl_port, 0)):
+            rule = _add_rule(ifname, f"flow-type {flow}{ipver} "
+                             f"dst-port {port} action {action}", host)
+            if not rule:
+                break
+            rules.append(rule)
+        else:
+            cfg.set_ipver(ipver)
+            return
+        for rule in reversed(rules):
+            rule.exec()
+    raise KsftSkipEx("the hosts reject the ntuple rules of the test")
+
+
+def _setup_nic(cfg, udp_port, ctrl_port):
+    """Take the last queue with both an RX and a TX ring out of RSS and steer
+    the flows of a case until it ends. Return the queue and the frags per
+    packet that the DUT takes in zero-copy mode."""
+    dev = cfg.netnl.dev_get({"ifindex": cfg.ifindex})
+    if "xsk-zerocopy" not in dev["xdp-features"]:
+        raise KsftSkipEx(f"{cfg.ifname} does not support AF_XDP zero-copy")
+
+    req = {"header": {"dev-index": cfg.ifindex}}
+    try:
+        ch = cfg.ethnl.channels_get(req)
+        indir = cfg.ethnl.rss_get(req).get("indir")
+    except NlError as e:
+        raise KsftSkipEx(f"cannot get the channels or RSS of {cfg.ifname}") \
+            from e
+    queue = ch.get("combined-count", 0) + min(ch.get("rx-count", 0),
+                                              ch.get("tx-count", 0)) - 1
+    if queue < 1:
+        raise KsftSkipEx("Test requires NETIF with at least 2 channels")
+    if not indir:
+        raise KsftSkipEx(f"{cfg.ifname} has no RSS indirection table")
+
+    # Restore the table last, once ntuple-filters are off again, as turning
+    # them on or off can reset the NIC.
+    defer(_restore_rss, cfg, indir)
+    for ifname, host in ((cfg.ifname, None), (cfg.remote_ifname, cfg.remote)):
+        feat = ethtool(f"-k {ifname}", json=True, host=host)[0]
+        set_ethtool_feat(ifname, feat, {"ntuple-filters": True}, host=host)
+    try:
+        ethtool(f"-X {cfg.ifname} equal {queue}")
+    except CmdExitFailure as e:
+        raise KsftSkipEx(f"{cfg.ifname} cannot take queue {queue} "
+                         "out of RSS") from e
+    _steer(cfg, queue, udp_port, ctrl_port)
+    return queue, dev.get("xdp-zc-max-segs", 1)
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
+    # may ignore it, and the link may still be down after a NIC reset.
+    deadline = time.monotonic() + NIC_XSK_TIMEOUT
+    while True:
+        cmd(f"ping -c1 -W1 -I{ifname} {gw}", host=host, fail=False)
+        # Unlike "neigh get", "neigh show" has JSON output in older iproute2.
+        neigh = ip(f"neigh show {gw} dev {ifname}", json=True, host=host)
+        if neigh and "lladdr" in neigh[0]:
+            return neigh[0]["lladdr"]
+        if time.monotonic() > deadline:
+            raise KsftFailEx(f"cannot resolve the MAC address of gateway {gw}")
+        time.sleep(0.1)
+
+
+def _set_ring(ifname, ring, size, host=None):
+    """Set a ring of ifname with ethtool -G. A driver can refuse that while
+    an XSK socket that just closed still holds a queue, as ice does until a
+    work item releases the buffer pool of the socket, so retry for a while."""
+    deadline = time.monotonic() + RING_BUSY_TIMEOUT
+    while True:
+        try:
+            ethtool(f"-G {ifname} {ring} {size}", host=host)
+            return
+        except CmdExitFailure as e:
+            if "Device or resource busy" not in e.cmd.stderr or \
+               time.monotonic() > deadline:
+                raise
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
+def _run(cfg, local_args, remote_args, timeout):
+    """Start the local endpoint, and the remote one once the local one
+    listens. Log the output of an endpoint that does not pass, and return
+    their exit codes."""
+    # Wait for each endpoint until timeout(1) has ended it, not just the 20 s
+    # that bkg() waits for the local one to exit.
+    wait = timeout + 10
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
+    # A case that fails to clean up can leave an XDP program behind.
+    for ifname, host in ((cfg.ifname, None), (cfg.remote_ifname, cfg.remote)):
+        if "xdp" in ip(f"link show dev {ifname}", json=True, host=host)[0]:
+            raise KsftSkipEx(f"{ifname} already has an XDP program")
+    if "UNALIGNED" in case.name:
+        _reserve_hugepages()
+        _reserve_hugepages(cfg.remote)
+
+    udp_port = rand_port(socket.SOCK_DGRAM)
+    ctrl_port = rand_port()
+    if cfg.sw_drv:
+        # Both endpoints bind queue 0 of their end of the veth pair.
+        timeout, xsk_timeout = VETH_CASE_TIMEOUT, VETH_XSK_TIMEOUT
+        queue, max_frags = 0, _setup_veth(case)
+    else:
+        timeout, xsk_timeout = NIC_CASE_TIMEOUT, NIC_XSK_TIMEOUT
+        queue, max_frags = _setup_nic(cfg, udp_port, ctrl_port)
+
+    if busy_poll:
+        # So that SO_PREFER_BUSY_POLL of xskxceiver -b keeps the IRQs masked.
+        for attr, val in (("napi_defer_hard_irqs", 2),
+                          ("gro_flush_timeout", 200000)):
+            ctl_file_write(f"/sys/class/net/{cfg.ifname}/{attr}", val)
+    if case.name in RING_SIZES:
+        _size_rings(cfg, case.name, case.direction)
+
+    # The endpoints detach their XDP programs and restore the MTU, but cannot
+    # tell whether the detach worked, and one that gets killed does neither.
+    # Defers run in reverse, so the XDP programs, which can cap the MTU, go
+    # first.
+    defer(ip, f"link set dev {cfg.ifname} mtu {cfg.dev['mtu']}")
+    defer(ip, f"link set dev {cfg.remote_ifname} mtu {cfg.remote_dev['mtu']}",
+          host=cfg.remote)
+    defer(ip, f"link set dev {cfg.ifname} {XDP_OFF[case.mode]}")
+    defer(ip, f"link set dev {cfg.remote_ifname} {XDP_OFF['skb']}",
+          host=cfg.remote)
+
+    local_dmac = _next_hop_mac(cfg, cfg.remote_addr,
+                               cfg.remote_dev["address"], cfg.ifname)
+    remote_dmac = _next_hop_mac(cfg, cfg.addr, cfg.dev["address"],
+                                cfg.remote_ifname, cfg.remote)
+
+    args = ["-p", cfg.addr,
+            "-P", str(ctrl_port),
+            "-t", str(case.test_id),
+            "--udp-port", str(udp_port),
+            "--max-frags", str(max_frags),
+            "--timeout", str(xsk_timeout)]
+    local = ["timeout", "-k", "5", str(timeout), str(cfg.bin_local),
+             "-i", cfg.ifname,
+             "--queue", str(queue),
+             "--listen",
+             "-m", case.mode,
+             "-e", case.direction,
+             *(["-b"] if busy_poll else []),
+             "--src-ip", cfg.addr,
+             "--dst-ip", cfg.remote_addr,
+             "--dst-mac", local_dmac,
+             *args]
+    remote = ["timeout", "-k", "5", str(timeout), str(cfg.bin_remote),
+              "-i", cfg.remote_ifname,
+              "--queue", "0",
+              "-m", "skb",
+              "-e", "tx" if case.direction == "rx" else "rx",
+              "--src-ip", cfg.remote_addr,
+              "--dst-ip", cfg.addr,
+              "--dst-mac", remote_dmac,
+              *args]
+
+    local_ret, remote_ret = _run(cfg, local, remote, timeout)
+    rets = {local_ret, remote_ret}
+    # An endpoint that skips the case tells its peer, which skips it too.
+    if SKIP_CODE in rets and rets <= {0, SKIP_CODE}:
+        raise KsftSkipEx("xskxceiver skipped the case")
+    ksft_eq(local_ret, 0, "local endpoint exit code")
+    ksft_eq(remote_ret, 0, "remote endpoint exit code")
+
+
+@ksft_disruptive
+def test_xsk(cfg, case):
+    """Run a case with the endpoints driven by interrupts."""
+    _test(cfg, case, busy_poll=False)
+
+
+@ksft_disruptive
+def test_xsk_busy_poll(cfg, case):
+    """Run a case with the local endpoint busy polling."""
+    _test(cfg, case, busy_poll=True)
+
+
+def main():
+    """Run the cases over veth without NETIF, else on NETIF."""
+    with NetDrvEpEnv(__file__, sw_drv="veth") as cfg:
+        cfg.bin_local = cfg.net_lib_dir / "xskxceiver"
+        cases = _get_cases(cfg)
+        cfg.bin_remote = cfg.remote.deploy(cfg.bin_local)
+        cfg.ethnl = EthtoolFamily()
+        cfg.netnl = NetdevFamily()
+
+        ksft_run([ksft_variants(cases)(test_xsk),
+                  ksft_variants(cases)(test_xsk_busy_poll)], args=(cfg,))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/testing/selftests/net/lib/Makefile b/tools/testing/selftests/net/lib/Makefile
index b2f01c4e599b..675b1b31571d 100644
--- a/tools/testing/selftests/net/lib/Makefile
+++ b/tools/testing/selftests/net/lib/Makefile
@@ -35,7 +35,7 @@ include ../../lib.mk
 BPF_PROG_DIRS := xsk
 include ../bpf.mk
 
-# AF_XDP test engine.
+# AF_XDP test engine used by drivers/net/xsk.py.
 XSK_SRCS := $(filter-out %.bpf.c,$(wildcard xsk/*.c)) \
 	$(top_srcdir)/tools/lib/find_bit.c
 
diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
index a0ad1df00212..2aadb95c61fa 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c
@@ -2546,7 +2546,8 @@ static bool hugepages_present(void)
 	void *bufs;
 
 	bufs = mmap(NULL, mmap_sz, PROT_READ | PROT_WRITE,
-		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, MAP_HUGE_2MB);
+		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB | MAP_HUGE_2MB,
+		    -1, 0);
 	if (bufs == MAP_FAILED)
 		return false;
 
diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
index 7d6aa464c660..bc92de5e8323 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
@@ -6,14 +6,18 @@
  * Linux kernel samples/bpf/xdpsock* and modified
  * for use.
  *
+ * See drivers/net/xsk.py for detailed information on test topology
+ * and prerequisite network setup.
+ *
  * Each instance of this test program runs one endpoint, Tx or Rx, with a
  * single socket and a unique UMEM. Two instances validate in-order packet
  * delivery and packet content by sending packets to each other.
  *
  * Tests Information:
  * ------------------
- * These selftests test AF_XDP SKB and Native/DRV modes using veth
- * Virtual Ethernet interfaces.
+ * These selftests test AF_XDP SKB and Native/DRV modes over a veth pair.
+ * On a physical device, they test the hardware cases in zero-copy mode,
+ * with an SKB-mode peer on a remote host.
  *
  * For each mode, the following tests are run:
  *    a. nopoll - soft-irq processing in run-to-completion mode
@@ -38,32 +42,27 @@
  *            Reduce the size of the RX ring to a fraction of the fill ring size.
  *       iv.  fill queue empty
  *            Do not populate the fill queue and then try to receive pkts.
- *    f. bpf_link resource persistence
- *       Configure sockets at indexes 0 and 1, run a traffic on queue ids 0,
- *       then remove xsk sockets from queue 0 on both veth interfaces and
- *       finally run a traffic on queues ids 1
- *    g. unaligned mode
- *    h. tests for invalid and corner case Tx descriptors so that the correct ones
+ *    f. unaligned mode
+ *    g. tests for invalid and corner case Tx descriptors so that the correct ones
  *       are discarded and let through, respectively.
- *    i. 2K frame size tests
- *    j. If multi-buffer is supported, send 9k packets divided into 3 frames
- *    k. If multi-buffer and huge pages are supported, send 9k packets in a single frame
+ *    h. 2K frame size tests
+ *    i. If multi-buffer is supported, send 9k packets divided into 3 frames
+ *    j. If multi-buffer and huge pages are supported, send 9k packets in a single frame
  *       using unaligned mode
- *    l. If multi-buffer is supported, try various nasty combinations of descriptors to
+ *    k. If multi-buffer is supported, try various nasty combinations of descriptors to
  *       check if they pass the validation or not
  *
  * Flow:
  * -----
- * - Two processes run the test: Tx and Rx
- * - Each of these two processes attach to a veth interface
- * - Each process creates one AF_XDP socket connected to a unique umem for each
- *   veth interface
+ * - drivers/net/xsk.py starts two processes: Tx and Rx
+ * - Each process attaches to one end of the link: a veth interface, or the
+ *   NIC under test or its peer on the remote host
+ * - Each process creates one AF_XDP socket connected to a unique umem
  * - One process listens on a TCP control port (--listen), the other one
  *   connects to it and the two synchronize each test step over that
  *   connection
- * - Tx process transmits a number of UDP packets over IPv4 or IPv6 from
- *   veth<xxxx> to veth<yyyy>, and the XDP program of Rx passes other traffic
- *   to the stack
+ * - Tx process transmits a number of UDP packets over IPv4 or IPv6 to Rx,
+ *   and the XDP program of Rx passes other traffic to the stack
  * - Rx process verifies if all packets were received and delivered in-order,
  *   and have the right content
  */
-- 
2.43.0

